import MySQLdb as mdb
import matplotlib.pyplot as plt

HOST = 'yarn.cueaar94ytrf.us-east-1.rds.amazonaws.com'
PORT = 3306
USER = 'yarn'
PASSWD = 'yarn1234'
DB = 'yarn'

query = "SELECT time_elapsed, allocated_mb from cluster_metrics where experiment_id = 2 order by time_elapsed" 

try:
    con = mdb.connect(host=HOST, port=PORT, user=USER, passwd=PASSWD, db=DB)
    cur = con.cursor()
    cur.execute(query)

    results = cur.fetchall()
    
    time = []
    allocated_mb = []
    
    for result in results:
        time.append(result[0]/1000)
        allocated_mb.append(result[1])
    
    plt.plot(time, allocated_mb)
    plt.show()
    
except _mysql.Error, e:
    print "Error %d: %s" % (e.args[0], e.args[1])
    sys.exit(1)

finally:
    if con:
        con.close()

