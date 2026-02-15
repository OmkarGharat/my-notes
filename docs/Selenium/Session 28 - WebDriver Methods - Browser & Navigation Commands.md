WebDriver driver = new ChromeDriver();
driver.manage().window().maximize();

driver.navigate().to("https://opensource-demo.orangehrmlive.com/web/index.php/auth/login");
Thread.sleep(3000);

driver.navigate().back();
driver.navigate().forward();
driver.navigate().refresh();

System.out.println(driver.getWindowHandle());

Set<String> windowsIDs = driver.getWindowHandles();
// or you can write it as 
List<String> mylist = new ArrayList<String>(driver.getWindowHandles());

## Approach 1 : if you have 2 to 3 browser tabs

List<String> windowsList = new ArrayList<String>(windowsIDs);

String parentId = windowsList.get(0);
String childId = windowsList.get(1);

// switch to child window
driver.switchTo().window(childId);
System.out.println("Child window title : " + driver.getTitle());

// switch to parent window
driver.switchTo().window(parentId);
System.out.println("Parent window title : " + driver.getTitle());

## Approach 2 : if you have multiple browser tabs

for (String winElement : windowsList) {
	var title = driver.switchTo().window(winElement).getTitle();
			
	if(title.equals("OrangeHRM")) {
		System.out.println(driver.switchTo().window(winElement));
	}		
}