---
lab:
    title: 'Classify images with the Custom Vision Service'
    module: 'Module 1: Explore Computer Vision'
---

# Classify images with the Custom Vision Service

The *Computer Vision* cognitive service provides useful pre-built models for working with images, but you'll often need to train your own model for computer vision. For example, suppose the Northwind Traders retail company wants to create an automated checkout system that identifies the grocery items customers want to buy based on an image taken by a camera at the checkout. To do this, you'll need to train a classification model that can classify the images to identify the item being purchased.

In Azure, you can use the ***Custom Vision*** cognitive service to train an image classification model based on existing images. There are two elements to creating an image classification solution. First, you must train a model to recognize different classes using existing images. Then, when the model is trained you must publish it as a service that can be consumed by applications.

## Create a Custom Vision resource

To use the Custom Vision service, you need an Azure resource that you can use to *train* a model, and a resource with which you can *publish* it for applications to use. The resource for either (or both) tasks can be a general **Cognitive Services** resource, or a specific **Custom Vision** resource. You can use the same Cognitive Services resource for each of these tasks, or you can use different resources (in the same region) for each task to manage costs separately.

Use the following instructions to create a new **Custom Vision** resource.

1. In a new browser tab, open the Azure portal at [https://portal.azure.com](https://portal.azure.com), and sign in using the Microsoft account associated with your Azure subscription.
2. Select the **&#65291;Create a resource** button, search for *custom vision*, and create a **Custom Vision** resource with the following settings:
    - **Create options**: Both
    - **Subscription**: *Your Azure subscription*
    - **Resource group**: *Create a new resource group with a unique name*
    - **Name**: *Enter a unique name*
    - **Training location**: *Choose any available region*
    - **Training pricing tier**: Free F0
    - **Prediction location**: *The same region as the training resource*
    - **Prediction pricing tier**: Free F0

    > **Note**: If you already have an F0 custom vision service in your subscription, select **S0** for this one.

3. Wait for the resources to be created, and note that two Custom Vision resources are provisioned; one for training, and another for prediction. You can view these by navigating to the resource group where you created them.

## Create a Custom Vision project

To train an object detection model, you need to create a Custom Vision project based on your training resource. To do this, you'll use the Custom Vision portal.

1. Download and extract the training images from https://aka.ms/fruit-images. These images are provided in a zipped folder, which when extracted contains subfolders called **apple**, **banana**, and **orange**.
2. In another browser tab, open the Custom Vision portal at [https://customvision.ai](https://customvision.ai). If prompted, sign in using the Microsoft account associated with your Azure subscription and agree to the terms of service.
3. In the Custom Vision portal, create a new project with the following settings:
    - **Name**: Grocery Checkout
    - **Description**: Image classification for groceries
    - **Resource**: *The Custom Vision resource you created previously*
    - **Project Types**: Classification
    - **Classification Types**: Multiclass (single tag per image)
    - **Domains**: Food
4. Click **\[+\] Add images**, and select all of the files in the **apple** folder you extracted previously. Then upload the image files, specifying the tag *apple*, like this:

    ![Upload apple with apple tag](./media/upload_apples.jpg)
   
5. Repeat the previous step to upload the images in the **banana** folder with the tag *banana*, and the images in the **orange** folder with the tag *orange*.
6. Explore the images you have uploaded in the Custom Vision project - there should be 15 images of each class, like this:

    ![Tagged images of fruit - 15 apples, 15 bananas, and 15 oranges](./media/fruit.jpg)
    
7. In the Custom Vision project, above the images, click **Train** to train a classification model using the tagged images. Select the **Quick Training** option, and then wait for the training iteration to complete (this may take a minute or so).
8. When the model iteration has been trained, review the *Precision*, *Recall*, and *AP* performance metrics - these measure the prediction accuracy of the classification model, and should all be high.

## Test the model

Before publishing this iteration of the model for applications to use, you should test it.

1. Above the performance metrics, click **Quick Test**.
2. In the **Image URL** box, type `https://aka.ms/apple-image` and click &#10132;
3. View the predictions returned by your model - the probability score for *apple* should be the highest, like this:

    ![An image with a class prediction of apple](./media/test-apple.jpg)

4. Close the **Quick Test** window.

## Publish the image classification model

Now you're ready to publish your trained model and use it from a client application.

9. Click **&#128504; Publish** to publish the trained model with the following settings:
    - **Model name**: groceries
    - **Prediction Resource**: *The prediction resource you created previously*.
10. After publishing, click the *Prediction URL* (&#127760;) icon to see information required to use the published model, which should look like this:

    ![Prediction URL information for a custom vision model](./media/custom-vision-url.png)

    Later, you will need the appropriate URL and Prediction-Key values to get a prediction from an Image URL, so keep this dialog box open and carry on to the next task.

## Create a cloud shell

To consume your custom vision model from a client, we'll use a simple command-line application that runs in the cloud shell provided with your Azure subscription.

1. Switch to the browser tab containing the Azure portal, and select the [**>_**] (*Cloud Shell*) button at the top of the page to the right of the search box. This opens a Cloud Shell pane at the bottom of the portal, as shown here.

    ![Azure cloud shell pane](./media/cloud-shell.png)

2. The first time you open the cloud shell, you will be prompted to choose the type of shell you want to use (*Bash* or *PowerShell*). Select **PowerShell**.
3. If you are prompted to create storage for your cloud shell, ensure your subscription is specified and select **Create storage**. Then wait a minute or so for the storage to be created. Eventually, the cloud shell pane will display a command prompt like this:

    ![Azure cloud shell PowerShell prompt](./media/powershell-prompt.png)

    > **Note**: If you selected *Bash*, or you had previously opened a Bash cloud shell, you can switch to PowerShell by using the drop-down menu at the top left of the cloud shell pane.

## Configure and run a client application

Now that you have a cloud shell environment, you can run a simple client application that uses the Computer Vision service to analyze an image.

1. In the command shell, enter the following command to download the sample application.

    ```
    git clone https://github.com/GraemeMalcolm/ai-stuff
    ```

2. The files are downloaded to a folder named **ai-stuff**. To see all of the files in your cloud shell storage, select the **{ }** (*Open editor*) icon on the bar at the top of the cloud shell pane. This opens an additional editor pane above the cloud shell pane, like this:

    ![Azure cloud shell editor](./media/editor-pane.png)

3. Use the separator bar above the editor pane to resize it so you can see more clearly, and then in the **Files** pane on the left, expand **ai-stuff** and select **classify-image.ps1**. This file contains some code that uses your Custom Vision model to classify an image, as shown here:

    ![The editor containing code to classify an image](./media/classify-image-code.png)

4. Don't worry too much about the details of the code, the important thing is that it needs the prediction URL and key for your Custom Vision model when using an image URL. Copy these from the prediction URL dialog box in your Custom Vision project (which should still be open in another browser tab) and paste them into the code editor, replacing the **YOUR_PREDICTION_URL** and **YOUR_PREDICTION_KEY** placeholder values respectively.

    After pasting the endpoint and key values, the first two lines of code should look similar to this:

    ```PowerShell
    $predictionUrl="https://mycv.cognitiveservices.azure.com/.../groceries/url"
    $predictionKey = "123abc456def789ghi0klmnopq"
    ```

5. At the top right of the editor pane, use the **...** button to open the menu and select **Save** to save your changes. Then open the menu again and select **Close Editor**.

    You will use the sample client application to classify the following images:

    | 1 | 2 | 3 |
    |---|---|---|
    |![An image of an apple](./media/fruit-1.jpg)| ![An image of a banana](./media/fruit-2.jpg)|![An image of an orange](./media/fruit-3.jpg)|

6. In the PowerShell pane, enter the following commands to run the code:

    ```
    cd ai-stuff
    .\classify-image.ps1 1
    ```

7. Review the prediction, which should be **apple**.

8. Now let's try another image:

    ```
    .\classify-image.ps1 2
    ```

9. Verify that the model classifies this image as **banana**.

10. Finally, let's try the third test image:

    ```
    .\classify-image.ps1 3
    ```

11. Verify that the model classifies this image as **orange**.

## Learn more

This simple app shows only some of the capabilities of the Custom Vision service. To learn more about what you can do with this service, see the [Custom Vision page](https://azure.microsoft.com/services/cognitive-services/custom-vision-service/).
