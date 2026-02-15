# Screenshots using Ashot()

// Code 1 : full page screenshot

Screenshot screenshot = new AShot()
							.shootingStrategy(ShootingStrategies.viewportPasting(1000))
							.takeScreenshot(driver);
File targetFile = new File(System.getProperty("user.dir") + "\\\\screenshots\\\\fullpage.png");

ImageIO.write(screenshot.getImage(), "PNG", targetFile);

-   **AShot().takeScreenshot(driver)** → **हे पूर्ण page चा screenshot काढतं, specific WebElement नाही!**
    
-   **scrollIntoView() केल्यावर तो element visible होतो, पण AShot ला तरीही element specific instruction दिलेली नाही!**
    
-   **त्यामुळे full-page screenshot मध्ये तो element असतो, पण cropped आणि perfect WebElement screenshot नसेल!**
    
-   जर **scroll न करता** direct `AShot().takeScreenshot(driver, table);` वापरलास आणि table viewport च्या बाहेर असेल, तर तुला काहीही दिसणार नाही!
    
    म्हणून **पहिल्यांदा scroll** करून viewport मध्ये आणायचं आणि मग **AShot()** ने फक्त त्या element चा screenshot घ्यायचा! 📸✨
    

# **2️⃣ Specific WebElement चे Screenshot 📸**

var table = driver.findElement(By.xpath("//h2\[normalize-space()='Static Web Table'\]"));

// scroll till element
((JavascriptExecutor) driver).executeScript("arguments\[0\].scrollIntoView(true);", table);
Thread.sleep(1000); 

Screenshot screenshot = new AShot()
                          .takeScreenshot(driver, table);
File targetFile = new File(System.getProperty("user.dir") + "\\\\screenshots\\\\ss01.png");

ImageIO.write(screenshot.getImage(), "PNG", targetFile);

✅ **Use-case:** Header/Footer/Specific Section चे screenshot घ्यायला perfect!

![image-20250331-135159.png](attachments/19103746/19267811.png?width=760)![image-20250331-141740.png](attachments/19103746/18940012.png?width=760)![image-20250331-141827.png](attachments/19103746/18940019.png?width=760)

# ChromeOptions

ChromeOptions option = new ChromeOptions();

// to run in headless mode
option.addArguments("--headless=new");

// accept SSL certificates
option.setAcceptInsecureCerts(true);

// remove chrome is being controlled by Automation
option.setExperimentalOption("excludeSwitched", new String\[\] {"enable-automation"});

WebDriver driver = new ChromeDriver(option);