# CE(CodeEngine) Job Sample


## Overview

Sample Job application for IBM Cloud Code Engine, which would run with cron-like schedule.

This application itself would output current timestamp with ISO String format when executed. You can show those results from logs.


## How to setup

0. (If you want to use your own container image,) Build and Push your image into container registry like hub.docker.io. In this tutorial, I would use my own one(dotnsf/cejob).

  - You would need `docker` CLI to build you own image.

1. Create IBM Cloud account

  - Create IBM Cloud account, if you don't have one

    - https://cloud.ibm.com/register

2. Install / Setup ibmcloud CLI

  - Install ibmcloud CLI and CodeEngine CLI plugin into your PC
  
    - https://cloud.ibm.com/docs/codeengine?topic=codeengine-install-cli

3. Login to IBM Cloud with your ibmcloud CLI

  - `$ ibmcloud login`

4. Create and Select your CodeEngine project(`my-proj`)

  - Create : `$ ibmcloud ce project create --name my-proj`

  - Select : `$ ibmcloud ce project select --name my-proj`

  - Other commands:

    - List : `$ ibmcloud ce project list`

    - Show detail : `$ ibmcloud ce project get --name my-proj`

    - Delete : `$ ibmcloud ce project delete --name my-proj`

5. Create your application(`my-app`) in your selected project with image(dotnsf/cejob) and min-scale=1 settings

  - Create : `$ ibmcloud ce app create --name my-app --image dotnsf/cejob --min-scale=1`

  - Other commands:

    - Show detail : `$ ibmcloud ce app get --name my-app`

    - Delete : `$ ibmcloud ce app delete --name my-app`

6. Subscribe cron-like ping(`my-sub`) with your application(`my-app`) in your application, which would run every 5 min.

  - Create : `$ ibmcloud ce sub ping create --name my-sub --destination my-app --schedule "*/5 * * * *"`

  - Other commands:

    - Update(every 2H) : `$ ibmcloud ce sub ping update --name my-sub --schedule "0 */2 * * *"`

    - Show detail : `$ ibmcloud ce sub ping get --name my-sub`

    - Delete : `$ ibmcloud ce sub ping delete --name my-sub`

7. Show application log

  - Show Log : `$ ibmcloud ce app logs --name my-app`


## Reference

https://prstaging--knative-v1.netlify.app/v0.5-docs/eventing/samples/cronjob-source/

https://github.com/IBM/CodeEngine/tree/main/job

https://cloud.ibm.com/docs/codeengine?topic=codeengine-job-deploy

https://cloud.ibm.com/docs/codeengine?topic=codeengine-subscribe-ping-tutorial


## Licensing

This code is licensed under MIT.


## Copyright

2021  [K.Kimura @ Juge.Me](https://github.com/dotnsf) all rights reserved.
