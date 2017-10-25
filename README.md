# newrelic_demo_java
You need to modify "your-newrelic-key" in the script "run.sh"</br>
build docker images</br>
```docker build -t msfhubanbei/sample .```</br>
run docker</br>       
```docker run -d -p 58081:8080 msfhubanbei/sample```</br>

It will take about 10 minutes for startting up tomcat.</br>
Then you can access the sample by  http://your-machineip:58081/sample/.</br>

reference:</br>
https://kiwenlau.com/2016/01/09/160109-multiple-processes--docker-container/</br>
https://kiwenlau.com/2016/01/09/160109-multiple-processes--docker-container/</br>
https://docs.newrelic.com/docs/apm</br>
