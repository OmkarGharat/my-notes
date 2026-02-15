NOte that Handling SVG elements is not taught by Pavan Kumar sir, so Ask AMU

Also, Handling google dropdown is also pending, he gave code in i think next video of dropdowns, so see it and do it. Also make its notes, as it is important.

# ![(blue star)](images/icons/emoticons/72/flag_on.png) Handling Broken Links

## :1\_one\_circle\_orange: using Selenium

WebDriver driver = new ChromeDriver();
driver.manage().window().maximize();
WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(10));

try {
  driver.get("https://testautomationpractice.blogspot.com/");

  String errorLinkXpath = "//a\[normalize-space()='Errorcode 400'\]";
  WebElement errorLinkElement = wait
    .until(ExpectedConditions
      .presenceOfElementLocated(By.xpath(errorLinkXpath)));

  String errorLinkUrl = errorLinkElement.getDomAttribute("href");

  checkBrokenLink(errorLinkUrl);

} catch (Exception e) {
  System.out.println("An error occurred: " + e.getMessage());
}
}

public static void checkBrokenLink(String linkURL) {

    try {
      URL url = URI.create(linkURL).toURL();
      HttpURLConnection connection = (HttpURLConnection) url.openConnection();
      connection.setRequestMethod("HEAD");
      connection.connect();

      int responseCode = connection.getResponseCode();

      if (responseCode >= 400) {
        System.out.println(url + " is a Broken Link (Response Code: " + responseCode + ")");
      } else {
        System.out.println(url + " is Not a Broken Link (Response Code: " + responseCode + ")");
      }

      connection.disconnect();

    } catch (IOException e) {
      System.err.println("Error while checking link: " + e.getMessage());
    }

## :2\_two\_circle\_orange: Using Rest Assured

WebDriver driver = new ChromeDriver();
driver.manage().window().maximize();

driver.get("https://testautomationpractice.blogspot.com/");

String linkUrl = driver.findElement(By.xpath("//a\[normalize-space()='Errorcode 400'\]")).getDomAttribute("href");

int statusCode = RestAssured.get(linkUrl).statusCode();
System.out.println(linkUrl + " → Status Code: " + statusCode);

if (statusCode >= 400) {
  System.out.println(linkUrl + " is a Broken Link (Response Code: " + statusCode + ")");
} else {
  System.out.println(linkUrl + " is Not a Broken Link (Response Code: " + statusCode + ")");
}

# ![(blue star)](images/icons/emoticons/72/flag_on.png) SVG Elements

# ![(blue star)](images/icons/emoticons/72/flag_on.png) Shadow DOM

## :1\_one\_circle\_orange: If composed tree is flatten then follow straight structure i.e. flattened structure

// 1. Locate First-Level Shadow Host
var mainShadowHost = driver.findElement(By.cssSelector("book-app\[apptitle='BOOKS'\]"));
var mainShadowRoot = mainShadowHost.getShadowRoot();
System.out.println("Level 1 Shadow DOM completed");

// 2. Locate Second-Level Shadow Host
var secondShadowHost = mainShadowRoot.findElement(By.cssSelector("app-header\[effects='waterfall'\]"));
var secondShadowRoot = secondShadowHost.getShadowRoot();
System.out.println("Level 2 Shadow DOM completed");

// 3. Locate Third-Level Shadow Host
var thirdShadowHost = mainShadowRoot.findElement(By.cssSelector("app-toolbar.toolbar-bottom"));
var thirdShadowRoot = thirdShadowHost.getShadowRoot();
System.out.println("Level 3 Shadow DOM completed");

## :2\_two\_circle\_orange: If composed tree is not flatten then follow nested structure

// 1. Locate First-Level Shadow Host
var mainShadowHost = driver.findElement(By.cssSelector("book-app\[apptitle='BOOKS'\]"));
var mainShadowRoot = mainShadowHost.getShadowRoot();
System.out.println("Level 1 Shadow DOM completed");

// 2. Locate Second-Level Shadow Host
var secondShadowHost = mainShadowRoot.findElement(By.cssSelector("app-header\[effects='waterfall'\]"));
var secondShadowRoot = secondShadowHost.getShadowRoot();
System.out.println("Level 2 Shadow DOM completed");

// 3. Locate Third-Level Shadow Host
var thirdShadowHost = secondShadowRoot.findElement(By.cssSelector("app-toolbar.toolbar-bottom"));
var thirdShadowRoot = thirdShadowHost.getShadowRoot();
System.out.println("Level 3 Shadow DOM completed");