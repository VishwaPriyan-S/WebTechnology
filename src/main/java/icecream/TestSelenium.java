package icecream;

import java.time.Duration;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;

public class TestSelenium {

    public static void main(String[] args) throws InterruptedException {
        System.setProperty("webdriver.chrome.driver", "C:\\drivers\\chromedriver.exe");
        WebDriver driver = new ChromeDriver();

        try {
            // 1
            System.out.println("Step 1: Opening login page...");
            driver.get("http://localhost:8081/IceCream/login.jsp");

            // 2
            System.out.println("Step 2: Maximizing window...");
            driver.manage().window().maximize();
            Thread.sleep(500);

            // 3
            System.out.println("Step 3: Getting page title...");
            String actualTitle = driver.getTitle();
            System.out.println("Title: " + actualTitle);

            // 4
            System.out.println("Step 4: Getting current URL...");
            String actualUrl = driver.getCurrentUrl();
            System.out.println("URL: " + actualUrl);

            // 5
            System.out.println("Step 5: Typing into username field...");
            WebElement usernameField = driver.findElement(By.id("username"));
            usernameField.sendKeys("some-temporary-text");
            Thread.sleep(500);

            // 6
            System.out.println("Step 6: Clearing and retyping username & password...");
            usernameField.clear();
            Thread.sleep(500);
            usernameField.sendKeys("hello");
            driver.findElement(By.id("password")).sendKeys("hi");
            Thread.sleep(500);

            // 7
            System.out.println("Step 7: Clicking login button...");
            driver.findElement(By.cssSelector("button[type='submit']")).click();
            Thread.sleep(1500);

            // 8
            System.out.println("Step 8: Checking if menu heading is displayed...");
            WebElement menuHeading = driver.findElement(By.xpath("//h2[contains(text(),'Our Menu')]"));
            if (menuHeading.isDisplayed()) {
                System.out.println("Menu heading is displayed.");
            }

            // 9
            System.out.println("Step 9: Adding first item to cart...");
            driver.findElement(By.xpath("(//button[text()='Add to Cart'])[1]")).click();
            Thread.sleep(1000);

            // 10
            System.out.println("Step 10: Refreshing page...");
            driver.navigate().refresh();
            Thread.sleep(1000);

            // 11
            System.out.println("Step 11: Navigating to cart...");
            driver.get("http://localhost:8081/IceCream/cart.jsp");
            Thread.sleep(1000);

            // 12
            System.out.println("Step 12: Getting grand total...");
            WebElement totalElement = driver.findElement(By.id("grandTotal"));
            String grandTotal = totalElement.getText();
            System.out.println("Grand Total: " + grandTotal);

            // 13
            System.out.println("Step 13: Placing order...");
            driver.findElement(By.id("placeOrderBtn")).click();
            Thread.sleep(1000);

            // 14
            System.out.println("Step 14: Accepting alert...");
            driver.switchTo().alert().accept();
            Thread.sleep(1000);

            // 15
            System.out.println("Step 15: Checking empty cart message...");
            WebElement emptyCartMessage = driver.findElement(By.xpath("//td[contains(text(),'Cart is empty')]"));
            System.out.println("Cart Message: " + emptyCartMessage.getText());

            // 16
            System.out.println("Step 16: Attempting logout...");

            WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(5));
            WebElement logoutLink = wait.until(
                ExpectedConditions.elementToBeClickable(By.xpath("//a[contains(@href,'LogoutServlet')]"))
            );
            logoutLink.click();

        } finally {
            // 17
            System.out.println("Step 17: Closing browser...");
            driver.quit();
        }
    }
}
