package com.rahulswaminathan.yarnapplicationstatistics;
import java.lang.*;
import java.io.*;
import java.util.*;

public class BatchTenant implements Runnable {
  private String queueName;
  private String executorMem;
  private String driverMem;
  private String senario;

  public BatchTenant(String dmem, String emem, String queue, String sen) {
    this.queueName = queue;
    this.executorMem = emem;
    this.driverMem = dmem;
    this.senario = sen;
  }

  public void run() {
    if(senario.equals("1")) {
      senarioOne();
    }
    else if(senario.equals("2")) {
      senarioTwo();
    }
    else if(senario.equals("3")) {
      senarioThree();
    }
  }

  public void senarioOne() {
    System.out.println("Senario One is starting...");
    try {
      Thread.sleep(4000);

      new ProcessBuilder("/bin/bash", "/home/hadoop/" +
          "project1/script/fb/run-job-test.sh", queueName).start();

      Thread.sleep(4000);

      new ProcessBuilder("/bin/bash", "/home/hadoop/" +
          "project1/script/fb/run-job-test.sh", queueName).start();
    } catch (Exception e) {
      e.printStackTrace();
    }
  }

  public void senarioTwo() {
    System.out.println("Senario Two is starting...");
    try {
      Thread.sleep(4000);

      new ProcessBuilder("/bin/bash", "/home/hadoop/" +
          "project1/script/fb/run-job-test.sh", queueName).start();

      Thread.sleep(4000);

      new ProcessBuilder("/bin/bash", "/home/hadoop/" +
          "project1/script/fb/run-job-test.sh", queueName).start();
    } catch (Exception e) {
      e.printStackTrace();
    }
  }

  public void senarioThree() {
    System.out.println("Senario Three is starting...");
    try {
      Thread.sleep(4000);

      new ProcessBuilder("/bin/bash", "/home/hadoop/" +
          "project1/script/fb/run-job-test.sh", queueName).start();

      Thread.sleep(4000);

      new ProcessBuilder("/bin/bash", "/home/hadoop/" +
          "project1/script/fb/run-job-test.sh", queueName).start();
    } catch (Exception e) {
      e.printStackTrace();
    }
  }
}
