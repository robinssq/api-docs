AMP
========

Usage
-----

Find ``AMP-Smartlinks`` on `Github`_

AMP Smartlinks retrieves SmartLinks from a set of URLs on an AMP page, automatically creating new SmartLinks that do not already exist. AMP Smartlinks is our full :ref:`Linkmate <linkmate_api>` offering in AMP.

Your account must be a member of our LinkMate program to use this feature. For more information about this program, feel free to `contact us`_

* Make sure to replace "ACCOUNT NAME" with your Narrativ account name. If you aren't sure what you account name is then please reach out to your account manager or `contact us`_.

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
     - The presence of this attribute determines if ``linkmate`` is true or not.

   * - **exclusive-links**
     - Boolean
     - False
     - The presence of this attribute determines if ``exclusive-links`` will be made or not.

   * - **link-attribute**
     - string
     - False
     - Where you store the outbound link value. If it's not in ``href``.

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

* If you store outbound links in none ``href`` attributes then make sure to specify ``link-attribute`` in the element. Also, if you want to limit the selector used to detect links use ``link-selector``.
 ::

     <amp-smartlinks
         layout="nodisplay"
         nrtv-account-name="ACCOUNT NAME"
         linkmate
         link-attribute="data-vars-outbound-link"
         link-selector="a.links-to-be-monetized">
     </amp-smartlinks>

.. _Github: https://github.com/ampproject/amphtml/blob/master/extensions/amp-smartlinks/amp-smartlinks.md

.. _contact us: mailto:hello@narrativ.com
