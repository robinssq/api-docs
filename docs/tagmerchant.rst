Narrativ Advertiser Tag
====================================

Functionality
------------

The Narrativ advertiser tag allows Narrativ to track user behavior on an advertiser's site. Our AI optimizes
Narrativ's auction system by looking at data on page views and purchase behavior. Any other PII that is
captured, such as names, email addresses, etc. will be hashed and never stored in plain text. The tag runs
asynchronously in the background so there is no impact to page load times.

Implementation
------------

We track two types of events for our partners - check outs and page views

* Place the check out tag on the page that loads after your customer has finished shopping and paid
  for their purchase (your site's equivalent of a "Thank you for your order" page).

* Place the page view tag on every other page that loads during your user's journey, so that we can
  empower you with data on what products they are looking at before they check out.
  Important! Replace "ACCOUNT NAME" with your Narrativ account name in all snippets. Reach out to
  hello@narrativ.com for help with your Narrativ account name as needed.

Adding Information About Your Checkout Page
------------


For checkout events, you have to fill in some information about the checkout before loading our Javascript. This is
done by inserting the relevant data into a variable called window.BAMX_EVENT_DATA. If a field is optional, you can
just leave it out if you choose not to include the data.

*window.BAMX_EVENT_DATA*

.. list-table::
   :widths: 30 10 60
   :header-rows: 1

   * - Field Name
     - Type
     - Description

   * - user_email
     - string
     - Optional. The user's email address (this will be hashed before being stored - Narrativ does not store PII)

   * - page_type
     - string
     - Required. Must be "checkout" to tell the tag to fire a checkout event.

   * - user_id
     - string
     - Optional. The ID the user has in your system, if available.

   * - order_id
     - string
     - Required. The unique order_id for the checkout that just completed.

   * - order_value
     - float
     - Required. The total purchase price of the order.

   * - currency
     - string
     - Required. The three digit code for the currency that order_value is in (ex: 'USD'). Uses `ISO 4217`_

   * - products_purchased
     - array
     - Required. An array of Product objects representing the purchased items, as defined below.

*Product*

.. list-table::
   :widths: 30 10 60
   :header-rows: 1

   * - Field Name
     - Type
     - Description

   * - product_id
     - string
     - Required. The unique identifier for this product.

   * - product_name
     - string
     - Required. The name of the product.

   * - product_category
     - string
     - Optional. The `Google category`_ of the product.

   * - product_price
     - float
     - Required. The price of the product

   * - product_quantity
     - integer
     - Required. The number of this product purchased in this order.

Full Example (remember, replace ACCOUNT NAME with your account name)

What you see below is just an example. You cannot copy and paste it as is. Insert the check out
information from your own page into our data layer using Javascript before loading the Narrativ tag.

::

    <!-- begin NARRATIV jstag -->
    <script type="text/javascript">
        var products = [
            {
                product_id: 'A101',
                product_name: 'Widget 1',
                product_category: 'Electronics > Audio > Audio Accessories > MP3 Player Accessories',
                product_price: 42.00,
                product_quantity: 5
            }, {
                product_id: 'A104',
                product_name: 'Widget 2',
                product_category: 'Electronics > Audio > Audio Accessories > MP3 Player Accessories',
                product_price: 3.50,
                product_quantity: 1
            }
        ]
        window.BAMX_EVENT_DATA = {
            page_type: 'checkout',
            user_id: '1234',
            products_purchased: products,
            order_id: '470',
            order_value: 213.50,
            currency: 'USD',
        };

        (function (account) {
            try {
              var b = document.createElement("script");
              b.type = "text/javascript";
              b.src = "//static.narrativ.com/tags/" + account + ".js";
              b.async = true;
              var a = document.getElementsByTagName("script")[0];
              a.parentNode.insertBefore(b, a);
            } catch (e) {}
        }("ACCOUNT NAME"));
    </script>
    <!-- end NARRATIV jstag -->


Adding Information for the Page View Tag
------------

The page view tag goes on every page except the checkout page. Remember to change ACCOUNT NAME to your account name.

*window.BAMX_EVENT_DATA*

.. list-table::
   :widths: 30 10 60
   :header-rows: 1

   * - Field Name
     - Type
     - Description

   * - user_email
     - string
     - The user's email address (this will be hashed before being stored - Narrativ does not store PII)

   * - user_id
     - string
     - The ID the user has in your system, if available.

What you see below is another example. You cannot copy and paste it as is. Insert the page view
information into our data layer using Javascript before loading the Narrativ tag.

::

    <!-- begin NARRATIV jstag -->
    <script type="text/javascript">
        window.BAMX_EVENT_DATA = {
            user_email: 'email@gmail.com',
            user_id: '1234'
        }
        (function (account) {
            try {
                var b = document.createElement("script");
                b.type = "text/javascript";
                b.src = "//static.narrativ.com/tags/" + account + ".js";
                b.async = true;
                var a = document.getElementsByTagName("script")[0];
                a.parentNode.insertBefore(b, a);
            } catch (e) {}
        }("ACCOUNT NAME"));
    </script>
    <!-- end NARRATIV jstag -->

.. _Google category: https://support.google.com/merchants/answer/6324436?hl=en
.. _ISO 4217: https://www.iso.org/iso-4217-currency-codes.html
