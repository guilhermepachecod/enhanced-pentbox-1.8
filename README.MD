**README Title: Enhanced Features for Pentbox**

---

Hello GitHub Community,

I'm excited to share the recent improvements I've made to Pentbox, turning it into an even more versatile honeypot tool.

**Key Features:**

1. **Customized Execution:**
   Now, you can run Pentbox with greater flexibility by specifying a port parameter. For example:
   ```bash
   ruby autogeopentbox.rb 80
   ```
   This allows for a more tailored setup to meet specific requirements.

2. **IPinfo Geolocation Support:**
   I've added support for IPinfo, offering detailed geolocation information. To enable this feature, simply edit the `autogeohoneypot.rb` file and insert your IPinfo token like this:
   ```ruby
   access_token = 'XXXXXXXXXXXXX'
   ```
   Learn more at [https://ipinfo.io/developers](https://ipinfo.io/developers).

**Getting Started:**

1. **Clone the Repository:**
   ```bash
   git clone https://github.com/your-username/pentbox.git
   ```

2. **Navigate to the Pentbox Directory:**
   ```bash
   cd pentbox
   ```

3. **Custom Execution:**
   ```bash
   ruby autogeopentbox.rb <your-port-here>
   ```

4. **IPinfo Configuration:**
   Open the `autogeohoneypot.rb` file and add your IPinfo token:
   ```ruby
   access_token = 'XXXXXXXXXXXXX'
   ```

I invite you to explore these new features and welcome any feedback or contributions from the community. I hope these enhancements make Pentbox an even more valuable tool for you.

Thank you for your interest and support!

Best regards,

guilhermepachecod
guilhermepachecod@soft.dev.br
guilhermepachecod