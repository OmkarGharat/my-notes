# Code 1 :

package Day21;

import java.util.List;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;

public class Day33 {

	public static void main(String\[\] args) throws InterruptedException {

		// two assignments

		// 1. go to https://testautomationpractice.blogspot.com
		// and then take this table Pagination Web Table
		// and then fetch the data of each rows of each page and click on their respective checkboxes.
		// find total no. of rows per page and total no. of pages

		WebDriver driver = new ChromeDriver();
		driver.manage().window().maximize();

		driver.get("https://testautomationpractice.blogspot.com/");

		List<WebElement> pages = driver.findElements(By.xpath("//ul\[@id='pagination'\]/li"));
		System.out.println("Total no. of Pages : " + pages.size());

		for (int i = 1; i <= pages.size(); i++) {

			List<WebElement> rows = driver.findElements(By.xpath("//table\[@id='productTable'\]/tbody/tr"));
			System.out.println("Total no. of Rows : " + rows.size());

			for (WebElement row : rows) {
				var id = row.findElement(By.xpath(".//td\[1\]"));
				var Name = row.findElement(By.xpath(".//td\[2\]"));
				var Price = row.findElement(By.xpath(".//td\[3\]"));

				var checkbox = row.findElement(By.xpath(".//td\[4\]/input"));
				checkbox.click();

				System.out.println(id.getText());
				System.out.println(Name.getText());
				System.out.println(Price.getText());
			}

			if (i < pages.size()) {
				// clicking on next page number : 2 3 4
				driver.findElement(By.xpath("//ul\[@id='pagination'\]/li\[" + (i+1) + "\]")).click();
				Thread.sleep(3000);
			} 
		}
	}
}

# Code 2 :

package Day21;

import java.time.Duration;

import org.openqa.selenium.By;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;

public class Day33\_2 {

	public static void main(String\[\] args) throws InterruptedException {

		// TODO Assignment
		// 2.go to OrangeHRM and LoggedIn
		// go to PIM
		// scroll down and see the 4 line dropdown fetch its data and print it on console

		WebDriver driver = new ChromeDriver();
		WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(10)); // Explicit wait

		driver.manage().window().maximize();
		driver.get("https://opensource-demo.orangehrmlive.com/web/index.php/auth/login");

		// username
		var userName = wait
				.until(ExpectedConditions.presenceOfElementLocated(By.xpath("//input\[@placeholder='Username'\]")));
		userName.sendKeys("Admin");

		// password
		var password = wait
				.until(ExpectedConditions.presenceOfElementLocated(By.xpath("//input\[@placeholder='Password'\]")));
		password.sendKeys("admin123");

		// submit
		driver.findElement(By.xpath("//button\[@type='submit'\]")).click();

		// PIM menu
		var PIM = wait.until(ExpectedConditions.presenceOfElementLocated(By.xpath("//a\[normalize-space()='PIM'\]")));
		PIM.click();
		Thread.sleep(3000);

		var table\_body = wait
				.until(ExpectedConditions.presenceOfElementLocated(By.xpath("//div\[@class='oxd-table-body'\]")));

		// scroll the page
		((JavascriptExecutor) driver)
				.executeScript("arguments\[0\].scrollIntoView({block: 'center', inline: 'nearest'});", table\_body);
		Thread.sleep(500);
		System.out.println("Scrolled into view");

		// Explicit wait for the elements to be available
		var list1 = wait.until(ExpectedConditions.presenceOfAllElementsLocatedBy(
				By.xpath("//div\[@class='oxd-table-body'\]//div\[@class='oxd-table-cell oxd-padding-cell'\]\[3\]")));
		
		System.out.println("List 1 size: " + list1.size());
		
		for (WebElement webElement : list1) {
			System.out.println(webElement.getText());
		}
	}
}