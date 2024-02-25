**************************************************************************************************
get the projet directly from Dokcer Hub:
(Commande)

1. docker login
2. docker pull yaobh/project_linux:v1
3. docker run -it -p 9090:9090 yaobh/project_linux:v1

You will get these information below:
-------------------------------------------------------------------------------------------------------
Collecting usage statistics. To deactivate, set browser.gatherUsageStats to False.


  You can now view your Streamlit app in your browser.

  Network URL: http://172.17.0.2:9090
  External URL: http://212.221.45.17:9090
-------------------------------------------------------------------------------------------------------
But be careful!! if you don't deploy it on a server, please change the URL to 'localhost:9090'

***************************************************************************************************

With server: 

1.Cloner le repository

- git clone git@github.com:BeihaiYao/Projet-Linux.git
- cd Tradingproject

2.Construire l'image à partir du Dockerfile puis ouvrir lùapplication

- docker build -t nys .

3.Lancer ensuite l'application via docker sur port 9090 auùil faudra ouvrir au préalable

- docker run -it -p 9090:9090 nys
