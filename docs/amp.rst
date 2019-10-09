AMP
========

Narrativ's smartlink technology can be deployed to `Google AMP`_ pages.  To enable Smartlinks on your AMP page, please notify Narrativ and then integrate the ``amp-smartlinks`` tag into your AMP pages, as described below.

Usage
-----

In addition to the docs below, you may reference the information provided on AMP's `Github`_ page.

AMP Smartlinks searches the AMP article for Smartlink-compatible URLs, automatically creating new SmartLinks that do not already exist. AMP Smartlinks is our full Linkmate offering in AMP.

Your account must be a member of our LinkMate program to use this feature. For more information about this program, feel free to `contact us`_

* Make sure to replace "ACCOUNT NAME" with your Narrativ account name. If you don't know your account name, please reach out to your account manager or `contact us`_.

::

    <!doctype html>
    <html ⚡>
    <head>
      ...
      <meta name="amp-link-rewriter-priorities" content="amp-smartlinks amp-other-affiliate">
      <script async custom-element="amp-smartlinks" src="https://cdn.ampproject.org/v0/amp-smartlinks-0.1.js"></script>
      ...
      <script async src="https://cdn.ampproject.org/v0.js"></script>
    </head>
    <body>
        ...
        <amp-smartlinks
            layout="nodisplay"
            nrtv-account-name="ACCOUNT NAME"
            linkmate>
        </amp-smartlinks>
        ...
    </body>
    </html>

AMP Attribute values
--------------------

.. list-table::
   :widths: 10 10 10 70
   :header-rows: 1

   * - Attribute Name
     - Type
     - Required
     - Description

   * - **nrtv-account-name**
     - string
     - True
     - Your Narrativ account name.

   * - **linkmate**
     - Boolean
     - False
     - The presence of this attribute determines if Linkmate is true or not.

   * - **exclusive-links**
     - Boolean
     - False
     - The presence of this attribute determines if ``exclusive-links`` will be made or not.

   * - **link-attribute**
     - string
     - False
     - Where you store the outbound link value, if it is not in ``href``.

   * - **link-selector**
     - string
     - False
     - CSS selector for selecting links from the page. Default value is ``a``


* To make all LinkMate links on the page exclusive, you can use the ``exclusiveLinks`` flag in the ``amp-smartlinks`` element. Exclusive links means that links will only be matched to the original merchant.

 ::

   <amp-smartlinks
       layout="nodisplay"
       nrtv-account-name="ACCOUNT NAME"
       linkmate
       exclusive-links>
   </amp-smartlinks>

* If you are running ``amp-smartlinks`` with other affiliate tags then you have to specify the following element with the ordering you want your links to be monetized.

 ::

   ...
   <meta name="amp-link-rewriter-priorities" content="amp-smartlinks amp-other-affiliate">
   ...
   </head>
   <body>
   ...
     <amp-smartlinks
         layout="nodisplay"
         nrtv-account-name="ACCOUNT NAME"
         linkmate>
     </amp-smartlinks>

* If you do not use ``href`` attributes to specify the outbound links, then make sure to specify ``link-attribute`` in the element. Also, if you want to limit the selector used to detect links use ``link-selector``.

 ::

     <amp-smartlinks
         layout="nodisplay"
         nrtv-account-name="ACCOUNT NAME"
         linkmate
         link-attribute="data-vars-outbound-link"
         link-selector="a.links-to-be-monetized">
     </amp-smartlinks>

* To disable LinkMate on a specific link, add ``#donotlink`` to the end of the URL

::

   http://exampleproductlink.example/supercoolproduct/ref=ods?#donotlink

* To indicate an exclusive link, add ``#locklink`` to the end of the URL

::

   http://exampleproductlink.example/supercoolproduct/ref=ods?#locklink

.. _Google AMP: https://www.ampproject.org/
.. _Github: https://github.com/ampproject/amphtml/blob/master/extensions/amp-smartlinks/amp-smartlinks.md
.. _contact us: mailto:hello@narrativ.com
