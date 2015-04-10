package com.rahulswaminathan.yarnapplicationstatistics;


import org.codehaus.jackson.JsonNode;
import org.codehaus.jackson.annotate.JsonIgnoreProperties;
import org.codehaus.jackson.map.DeserializationConfig;
import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.type.TypeReference;

import java.sql.*;

/**
 * Created by shlee0605 on 15. 3. 18..
 */
public class DatabaseWrapper {

    static final int PORT = 3306;
    static final String HOST = "yarn.cueaar94ytrf.us-east-1.rds.amazonaws.com";
    static final String DB_NAME = "yarn";
    static final String USER = "yarn";
    static final String PASS = "yarn1234";
    private int experimentId;

    public DatabaseWrapper() {
        experimentId = computeExperimentId();
    }

    public static Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            return null;
        }

        try {
            connection = DriverManager.getConnection("jdbc:mysql://" + HOST + ":" + PORT + "/" + DB_NAME, USER, PASS);
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }

        return connection;
    }

    public void writeClusterMetrics(String response, long currentTimeElapsed) throws Exception {
        ClusterMetricsThread writerThread = new ClusterMetricsThread(response, currentTimeElapsed, experimentId);
        writerThread.run();
    }
    public void writeCapacitySchedulerMetrics(String response, long currentTimeElapsed) throws Exception {
        CapacitySchedulerMetricsThread writerThread = new CapacitySchedulerMetricsThread(response, currentTimeElapsed, experimentId);
        System.out.println("=========================================");
        writerThread.run();
    }

    public int computeExperimentId() {
        Connection connection = getConnection();

        String query = "SELECT MAX(experiment_id) FROM cluster_metrics";
        Statement stmt = null;
        int id = 0;
        try {
            stmt = connection.createStatement();
            ResultSet rs = stmt.executeQuery(query);
            if (rs.next()) {
                id = rs.getInt(1) + 1;
            }
            else {
                id = 1;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return id;
    }

    public int getExperimentId() {
        return experimentId;
    }
}

class ClusterMetricsThread implements Runnable {
    private String clusterMetricsResponse;
    private long timeElapsed;
    private int experimentId;

    public ClusterMetricsThread(String response, long time, int id) {
        clusterMetricsResponse = response;
        timeElapsed = time;
        experimentId = id;
    }

    public void run() {
        Connection connection = DatabaseWrapper.getConnection();
        ObjectMapper mapper = new ObjectMapper();
        ClusterMetrics metrics = null;
        try {
            metrics = mapper.readValue(clusterMetricsResponse, ClusterMetrics.class);
        } catch (Exception e) {
            e.printStackTrace();
        }

        String insertTableSQL = "INSERT INTO cluster_metrics"
                + "(experiment_id, time_elapsed , apps_submitted, apps_completed, apps_pending, apps_running,"
                + "apps_failed, apps_killed, reserved_mb, available_mb, allocated_mb, total_mb, reserved_virtual_cores,"
                + "available_virtual_cores, allocated_virtual_cores, total_virtual_cores, containers_allocated,"
                + "containers_reserved, containers_pending, total_nodes, active_nodes, lost_nodes,"
                + "unhealthy_nodes, decommisioned_nodes, rebooted_nodes) VALUES"
                + "(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
        PreparedStatement pstmt = null;

        try {
            pstmt = connection.prepareStatement(insertTableSQL);
            pstmt.setInt(1, experimentId);
            pstmt.setLong(2, timeElapsed);
            pstmt.setInt(3, metrics.getClusterMetrics().getAppsSubmitted());
            pstmt.setInt(4, metrics.getClusterMetrics().getAppsCompleted());
            pstmt.setInt(5, metrics.getClusterMetrics().getAppsPending());
            pstmt.setInt(6, metrics.getClusterMetrics().getAppsRunning());
            pstmt.setInt(7, metrics.getClusterMetrics().getAppsFailed());
            pstmt.setInt(8, metrics.getClusterMetrics().getAppsKilled());
            pstmt.setLong(9, metrics.getClusterMetrics().getReservedMB());
            pstmt.setLong(10, metrics.getClusterMetrics().getAvailableMB());
            pstmt.setLong(11, metrics.getClusterMetrics().getAllocatedMB());
            pstmt.setLong(12, metrics.getClusterMetrics().getTotalMB());
            pstmt.setLong(13, metrics.getClusterMetrics().getReservedVirtualCores());
            pstmt.setLong(14, metrics.getClusterMetrics().getAvailableVirtualCores());
            pstmt.setLong(15, metrics.getClusterMetrics().getAllocatedVirtualCores());
            pstmt.setLong(16, metrics.getClusterMetrics().getTotalVirtualCores());
            pstmt.setInt(17, metrics.getClusterMetrics().getContainersAllocated());
            pstmt.setInt(18, metrics.getClusterMetrics().getContainersReserved());
            pstmt.setInt(19, metrics.getClusterMetrics().getContainersPending());
            pstmt.setInt(20, metrics.getClusterMetrics().getTotalNodes());
            pstmt.setInt(21, metrics.getClusterMetrics().getActiveNodes());
            pstmt.setInt(22, metrics.getClusterMetrics().getLostNodes());
            pstmt.setInt(23, metrics.getClusterMetrics().getUnhealthyNodes());
            pstmt.setInt(24, metrics.getClusterMetrics().getDecommissionedNodes());
            pstmt.setInt(25, metrics.getClusterMetrics().getRebootedNodes());
            pstmt.execute();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

}



class CapacitySchedulerMetricsThread implements Runnable {
    private String schedulerMetricsResponse;
    private long timeElapsed;
    private int experimentId;

    public CapacitySchedulerMetricsThread(String response, long time, int id) {
        schedulerMetricsResponse = response;
        timeElapsed = time;
        experimentId = id;
    }

    public void run() {
        Connection connection = DatabaseWrapper.getConnection();
        ObjectMapper mapper = new ObjectMapper();


        mapper.configure(DeserializationConfig.Feature.FAIL_ON_UNKNOWN_PROPERTIES, false);
        Scheduler.queue[] schedulerQueues = null;
        try {
            //metrics = mapper.readValue(clusterMetricsResponse, ClusterMetrics.class);
            JsonNode node = mapper.readTree(schedulerMetricsResponse);
            node = node.get("scheduler").get("schedulerInfo").get("queues").get("queue");
            TypeReference<Scheduler.queue[]> typeRef = new TypeReference<Scheduler.queue[]>() {};
            schedulerQueues =  mapper.readValue(node.traverse(), typeRef);


        } catch (Exception e) {
            e.printStackTrace();
        }



        for (int i = 0; i < schedulerQueues.length; i++) {
            Scheduler.queue q = schedulerQueues[i];
            String insertTableSQL = "INSERT INTO capacity_scheduler_metrics"
                + "(experiment_id, time_elapsed, capacity, used_capacity, max_capacity, absolute_capacity,"
                +  "absolute_max_capacity, absolute_used_capacity, num_applications, queue_name, state,"
                +  "resource_used_memory, resource_used_vcores, num_active_applications, num_pending_applications,"
                +  "num_containers, max_applications, max_applications_per_user, max_active_applications,"
                +  "max_active_applications_per_user) VALUES"
                + "(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
            PreparedStatement pstmt = null;

            try {
                pstmt = connection.prepareStatement(insertTableSQL);
                pstmt.setInt(1, experimentId);
                pstmt.setLong(2, timeElapsed);
                pstmt.setFloat(3, q.getCapacity());
                pstmt.setFloat(4, q.getUsedCapacity());
                pstmt.setFloat(5, q.getMaxCapacity());
                pstmt.setFloat(6, q.getAbsoluteCapacity());
                pstmt.setFloat(7, q.getAbsoluteMaxCapacity());
                pstmt.setFloat(8, q.getAbsoluteUsedCapacity());
                pstmt.setInt(9, q.getNumApplications());
                pstmt.setString(10, q.getQueueName());
                pstmt.setString(11, q.getState());
                pstmt.setInt(12, q.getResourcesUsed().getMemory());
                pstmt.setInt(13, q.getResourcesUsed().getvCores());
                pstmt.setInt(14, q.getNumActiveApplications());
                pstmt.setInt(15, q.getNumPendingApplications());
                pstmt.setInt(16, q.getNumContainers());
                pstmt.setInt(17, q.getMaxApplications());
                pstmt.setInt(18, q.getMaxApplicationsPerUser());
                pstmt.setInt(19, q.getMaxActiveApplications());
                pstmt.setInt(20, q.getMaxActiveApplicationsPerUser());

                pstmt.execute();
            } catch (SQLException e) {
                e.printStackTrace();
            }


        }

    }

}

