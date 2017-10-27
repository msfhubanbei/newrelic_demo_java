# newrelic_demo_java
You need to modify "your-newrelic-key" in the script "run.sh"</br>
build docker images</br>
```docker build -t msfhubanbei/sample .```</br>
run docker</br>       
```docker run -d -p 58081:8080 msfhubanbei/sample```</br>

It will take about 10 minutes for startting up tomcat.</br>
Then you can access the sample by  http://your-machineip:58081/sample/.</br>

相关blog： 
http://blog.csdn.net/hubanbei2010/article/details/78365463</br>
实验环境图：</br>
newrelic_monitor_javaapp.pdf</br>


reference:</br>
https://kiwenlau.com/2016/01/09/160109-multiple-processes--docker-container/</br>
https://code.tutsplus.com/tutorials/how-to-monitor-docker-based-applications-using-new-relic--cms-24891</br>
https://docs.newrelic.com/docs/apm</br>
