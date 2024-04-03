/* eslint-disable no-console */
const puppeteer = require("puppeteer");

(async () => {
  try {
    const browser = await puppeteer.launch({
      headless: "shell",
      timeout: 0,
      args: [
        "--disable-gpu",
        "--no-sandbox",
        "--disable-setuid-sandbox",
        "--headless",
      ],
    });
    console.log(browser.executablePath());
    console.log("Chrome Headless launched successfully");
    const version = await browser.version();
    console.log(`Running: ${version}`);
    await browser.close();
  } catch (error) {
    console.error("Error launching Chrome Headless:", error);
    process.exit(1);
  }
})();
