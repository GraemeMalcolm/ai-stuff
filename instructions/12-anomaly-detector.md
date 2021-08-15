---
lab:
    title: 'Detect Anomalies with the Anomaly Detector'
    module: 'Module 5: Explore Decision Support'
---

# Detect Anomalies with the Anomaly Detector

Anomaly detection is an AI technique used to determine whether values in a series are within expected parameters. For example, a smart HVAC system might use anomaly detection to monitor temperature in a building and raise an alert if the temperature goes above or below the expected value for a given period of time.

## Create a *Anomaly Detector* resource

Let's start by creating a **Anomaly Detector** resource in your Azure subscription:

1. In another browser tab, open the Azure portal at [https://portal.azure.com](https://portal.azure.com?azure-portal=true), signing in with your Microsoft account.
2. Click the **&#65291;Create a resource** button, search for *Anomaly Detector*, and create a **Anomaly Detector** resource with the following settings:
    - **Subscription**: *Your Azure subscription*.
    - **Resource group**: *Select an existing resource group or create a new one*.
    - **Region**: *Choose any available region*
    - **Name**: *Enter a unique name*.
    - **Pricing tier**: Free F0

3. Review and create the resource, and wait for deployment to complete. Then go to the deployed resource.
4. View the **Keys and Endpoint** page for your Anomaly Detector resource. You will need the endpoint and keys to connect from client applications.

## Create a cloud shell

To test the capabilities of the Anomaly Detector service, we'll use a simple command-line application that runs in the cloud shell provided with your Azure subscription.

1. In the Azure portal, select the [**>_**] (*Cloud Shell*) button at the top of the page to the right of the search box. This opens a Cloud Shell pane at the bottom of the portal, as shown here.

    ![Azure cloud shell pane](./media/cloud-shell.png)

2. The first time you open the cloud shell, you will be prompted to choose the type of shell you want to use (*Bash* or *PowerShell*). Select **PowerShell**.
3. If you are prompted to create storage for your cloud shell, ensure your subscription is specified and select **Create storage**. Then wait a minute or so for the storage to be created. Eventually, the cloud shell pane will display a command prompt like this:

    ![Azure cloud shell PowerShell prompt](./media/powershell-prompt.png)

    > **Note**: If you selected *Bash*, or you had previously opened a Bash cloud shell, you can switch to PowerShell by using the drop-down menu at the top left of the cloud shell pane.

## Configure and run a client application

Now that you have a cloud shell environment, you can run a simple client application that uses the Anomaly Detector service to analyze an image.

1. In the command shell, enter the following command to download the sample application.

    ```
    git clone https://github.com/GraemeMalcolm/ai-stuff ai-900
    ```

2. The files are downloaded to a folder named **ai-900**. To see all of the files in your cloud shell storage, select the **{ }** (*Open editor*) icon on the bar at the top of the cloud shell pane. This opens an additional editor pane above the cloud shell pane, like this:

    ![Azure cloud shell editor](./media/editor-pane.png)

3. Use the separator bar above the editor pane to resize it so you can see more clearly, and then in the **Files** pane on the left, expand **ai-900** and select **detect-anomalies.ps1**. This file contains some code that uses the Anomaly Detector service to detect anomalous values in a data series, as shown here:

    ![The editor containing code to detect anomalies](./media/find-faces.png)

4. Don't worry too much about the details of the code, the important thing is that it needs the endpoint URL and either of the keys for your Anomaly Detector resource. Copy these from the **Keys and Endpoints** page for your resource (which should still be in the top area of the browser) and paste them into the code editor, replacing the **YOUR_ENDPOINT** and **YOUR_KEY** placeholder values respectively.

    >**Tip**: You may need to use the separator bar to adjust the screen area as you work with the **Keys and Endpoint** and **Editor** panes.

    After pasting the endpoint and key values, the first two lines of code should look similar to this:

    ```PowerShell
    $endpoint="https://resource.cognitiveservices.azure.com/"
    $key="1a2b3c4d5e6f7g8h9i0j...."
    ```

5. At the top right of the editor pane, use the **...** button to open the menu and select **Save** to save your changes. Then open the menu again and select **Close Editor**.

    The sample client application will use your Anomaly Detector service to analyze a file containing a series of date/times and numeric values.

6. In the PowerShell pane, enter the following commands to run the code:

    ```
    cd ai-900
    .\detect-anomalies.ps1
    ```

7. Review the results, noting that the final column in the results is True or False to indicate if the value is considered an anomaly:

## Learn more

This simple app shows only some of the capabilities of the Anomaly Detector service. To learn more about what you can do with this service, see the [Anomaly Detector page](https://azure.microsoft.com/services/cognitive-services/anomaly-detector/).
