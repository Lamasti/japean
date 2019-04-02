{**
 * 2007-2017 PrestaShop
 *
 * NOTICE OF LICENSE
 *
 * This source file is subject to the Open Software License (OSL 3.0)
 * that is bundled with this package in the file LICENSE.txt.
 * It is also available through the world-wide-web at this URL:
 * http://opensource.org/licenses/osl-3.0.php
 * If you did not receive a copy of the license and are unable to
 * obtain it through the world-wide-web, please send an email
 * to license@prestashop.com so we can send you a copy immediately.
 *
 * DISCLAIMER
 *
 * Do not edit or add to this file if you wish to upgrade PrestaShop to newer
 * versions in the future. If you wish to customize PrestaShop for your
 * needs please refer to http://www.prestashop.com for more information.
 *
 * @author    PrestaShop SA <contact@prestashop.com>
 * @copyright 2007-2017 PrestaShop SA
 * @license   http://opensource.org/licenses/osl-3.0.php Open Software License (OSL 3.0)
 * International Registered Trademark & Property of PrestaShop SA
 *}
	{foreach from=$product.features item=feature}

{if $feature.id_feature == 21}
    {if $feature.value == 'enstock'}
	  <p><img src="https://www.japean.com/themes/japean/img/produit-en-stock.jpg" alt="Expédié sous 24H"></p><p class="status_text">Expédié sous 24H</p>
        
	{elseif $feature.value == 'delais'}
      <p><img src="https://www.japean.com/themes/japean/img/delais-livraison.jpg" alt="Expédié sous 1 à 2 semaines"></p><p class="status_text">Expédié sous 1 à 2 semaines</p>
    {/if}
{elseif $feature.id_feature == 22}				
{/if}

{/foreach}
<div class="product-additional-info">
  {hook h='displayProductAdditionalInfo' product=$product}
</div>
