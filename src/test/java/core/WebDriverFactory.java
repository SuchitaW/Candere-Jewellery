package core;


import java.util.Iterator;
import java.util.Set;
import java.util.concurrent.TimeUnit;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;
import org.openqa.selenium.firefox.FirefoxDriver;

import io.github.bonigarcia.wdm.WebDriverManager;

public class WebDriverFactory {
	
	private static final Logger logger= LogManager.getLogger(WebDriverFactory.class);
	private static WebDriver driver= null;
	
//====================== Method to get WebDriver for Browser =========================================//
	public static WebDriver getWebDriverForBrowser(String browser)
	{
		
		ChromeOptions options=new ChromeOptions();
		options.addArguments("disable-notifications"); 
		
		switch(browser.toLowerCase())
		{
		case "chrome":
			//WebDriverManager.chromedriver().setup();
			driver= new ChromeDriver(options);
			logger.info("Chrome browser invoked");
			break;
		case "firefox":
			WebDriverManager.firefoxdriver().setup();
			driver= new FirefoxDriver();
			logger.info("Firefox browser invoked");
			break;
		case "edge":
			driver= new FirefoxDriver();
			logger.info("Edge browser invoked");
			break;
		case "headless":
			ChromeOptions option= new ChromeOptions();
			option.addArguments("headless");
			driver= new ChromeDriver(option);
			logger.info("Headless chrome browser invoked");
		default:
			logger.fatal("No such browser is implemented, browser name is: "+ browser);
		}
		driver.manage().window().maximize();
		driver.manage().deleteAllCookies();
		driver.manage().timeouts().implicitlyWait(40, TimeUnit.SECONDS);
		logger.info("browser window maximized and set timeout is 20 second");
		return driver;
	}
	
//=================== 1. Method to navigate to URL =======================================================//
	public static void navigateToURL(String url)
	{
		driver.manage().deleteAllCookies();
		driver.get(url);
		logger.info("navigate to url");
		
	}

//===================== 2. Method to quit the browser ====================================================//
	public static void quitTheBrowser()
	{
		driver.quit();
		logger.info("Quit the browser");
	}

//===================== 3. Method to switch to new window ===============================================//
	public static void switchToNewWindow()
	{
		//1.using Set
		Set <String> set= driver.getWindowHandles();
		Iterator <String> itr= set.iterator();
		itr.next();
		String newWindowId =itr.next();
		driver.switchTo().window(newWindowId);
        //2.Using ArrayList
//		ArrayList <String> arr= new ArrayList<String> (driver.getWindowHandles());
//		String childWindow=	arr.get(1);
//		driver.switchTo().window(childWindow);
		logger.info("Switch to new Window, its id is: "+ newWindowId);
	}

//====================== Method to get desired browser name =============================================//
	public static String getBrowserName()
	{
		String defaultBrowser= "chrome";                            //Set chrome as default browser
		String browserSentFromCmd= System.getProperty("chrome");  //Get browser name from command line
		if(browserSentFromCmd==null)
		{
			return defaultBrowser;
		}
		else 
		{
			return browserSentFromCmd;
		}
	}
//=======================================================================================================//


}
