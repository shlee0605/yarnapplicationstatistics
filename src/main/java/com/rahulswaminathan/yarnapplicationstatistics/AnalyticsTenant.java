package com.rahulswaminathan.yarnapplicationstatistics;
import java.lang.*;
import java.io.*;
import java.util.*;

public class AnalyticsTenant implements Runnable {
  private String queueName;
  private String executorMem;
  private String driverMem;

  public AnalyticsTenant(String dmem, String emem, String queue) {
    this.queueName = queue;
    this.executorMem = emem;
    this.driverMem = dmem;
  }

  public void run() {
    try {
      new ProcessBuilder("/bin/bash", "/Users/shlee0605/" +
          "bigdata/project1/script/interactive/interactive_test.sh", driverMem, executorMem, queueName).start();

      Thread.sleep(4000);

      new ProcessBuilder("/bin/bash", "/Users/shlee0605/" +
          "bigdata/project1/script/interactive/interactive_test.sh", driverMem, executorMem, queueName).start();
    } catch(Exception e) {
      e.printStackTrace();
    }
  }

}
