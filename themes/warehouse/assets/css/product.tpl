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
{extends file=$layout}

{block name='head_seo' prepend}
    <link rel="canonical" href="{$product.canonical_url}">
{/block}

{block name='head' append}
    <meta property="og:type" content="product">
    <meta property="og:url" content="{$urls.current_url}">
    <meta property="og:title" content="{$page.meta.title}">
    <meta property="og:site_name" content="{$shop.name}">
    <meta property="og:description" content="{$page.meta.description}">
    <meta property="og:image" content="{$product.cover.large.url}">
    <meta property="product:pretax_price:amount" content="{$product.price_tax_exc}">
    <meta property="product:pretax_price:currency" content="{$currency.iso_code}">
    <meta property="product:price:amount" content="{$product.price_amount}">
    <meta property="product:price:currency" content="{$currency.iso_code}">
    {if isset($product.weight) && ($product.weight != 0)}
        <meta property="product:weight:value" content="{$product.weight}">
        <meta property="product:weight:units" content="{$product.weight_unit}">
    {/if}

    {if $iqitTheme.bread_bg_category}
        {assign var="categoryImage"  value="img/c/`$product.id_category_default`-category_default.jpg"}
        {if file_exists($categoryImage)}
            <style> #wrapper .breadcrumb{  background-image: url('{$link->getCatImageLink($product.category, $product.id_category_default, 'category_default')}'); }</style>
        {/if}
    {/if}

{/block}


{block name='content'}
    <section id="main" itemscope itemtype="https://schema.org/Product">
        <meta itemprop="url" content="{$product.url}">

        <div class="row product-info-row">
            <div class="col-md-{$iqitTheme.pp_img_width} col-product-image">
                {block name='page_content_container'}
                    <section class="page-content" id="content">
                        {block name='page_content'}

                            {block name='product_cover_thumbnails'}
                                {include file='catalog/_partials/product-cover-thumbnails.tpl'}
                            {/block}

                            {block name='after_cover_thumbnails'}
                                <div class="after-cover-tumbnails text-center">{hook h='displayAfterProductThumbs'}</div>
                            {/block}

                        {/block}
                    </section>
                {/block}
            </div>

            <div class="col-md-{$iqitTheme.pp_content_width} col-product-info">
                {block name='page_header_container'}
                    <div class="product_header_container clearfix">

                        {block name='product_brand_below'}
                            {if $iqitTheme.pp_man_logo == 'next-title'}
                                {if isset($product_manufacturer->id)}
                                    {if isset($manufacturer_image_url)}
                                        <meta itemprop="brand" content="{$product_manufacturer->name}">
                                        <div class="product-manufacturer product-manufacturer-next float-right">
                                            <a href="{$product_brand_url}">
                                                <img src="{$manufacturer_image_url}"
                                                     class="img-fluid  manufacturer-logo"/>
                                            </a>
                                        </div>
                                    {/if}
                                {/if}
                            {/if}
                        {/block}

                        {block name='page_header'}
                        <h1 class="h1 page-title" itemprop="name"><span>{block name='page_title'}{$product.description_short nofilter}{/block}</span></h1>
                    {/block}
						{block name='product_prices'}
                        {include file='catalog/_partials/product-prices.tpl'}
                    {/block}

                        {block name='product_brand_below'}
                            {if $iqitTheme.pp_man_logo == 'title'}
                                {if isset($product_manufacturer->id)}
                                    <meta itemprop="brand" content="{$product_manufacturer->name}">
                                        {if isset($manufacturer_image_url)}
                                            <div class="product-manufacturer mb-3">
                                            <a href="{$product_brand_url}">
                                                <img src="{$manufacturer_image_url}"
                                                     class="img-fluid  manufacturer-logo"/>
                                            </a>
                                            </div>
                                        {else}
                                            <label class="label">{l s='Brand' d='Shop.Theme.Catalog'}:</label>
                                            <span>
            <a href="{$product_brand_url}">{$product_manufacturer->name}</a>
          </span>
                                        {/if}

                                {/if}
                            {/if}
                            {if $iqitTheme.pp_man_logo == 'next-title'}
                                {if isset($product_manufacturer->id)}
                                    {if !isset($manufacturer_image_url)}
                                        <meta itemprop="brand" content="{$product_manufacturer->name}">
                                        <label class="label">{l s='Brand' d='Shop.Theme.Catalog'}:</label>
                                        <span>
                                        <a href="{$product_brand_url}">{$product_manufacturer->name}</a>
                                        </span>
                                    {/if}
                                {/if}
                            {/if}
                        {/block}

                    
                    </div>
                {/block}
{block name='product_features'}
    {if $product.features}
        <section class="product-features">
            <dl class="data-sheet">
                {foreach from=$product.features item=feature}
                    <span class="name">{$feature.name} : </dt>
                    <span class="value">{$feature.value}</dd>
                {/foreach}
            </dl>
        </section>
    {/if}
{/block}
				{block name='product_reference'}
    {if isset($product.reference_to_display)}
        <div class="product-reference">
            <span class="label">{l s='Reference' d='Shop.Theme.Catalog'} : </label>
            <span class="sku" itemprop="sku">{$product.reference_to_display}</span>
        </div>
    {/if}
{/block}
                <div class="product-information">
					<div class="under_product_title">
						<div class="social_share_product">
					{hook h='displayReassurance' mod='iqitaddthisplugin'}
							</div>
						</div>
                    {block name='product_description_short'}
                        <div id="product-description-short-{$product.id}"
                             itemprop="description" class="rte-content">{$product.description nofilter}</div>
					</div>
                    {/block}

                    {if $product.is_customizable && count($product.customizations.fields)}
                        {block name='product_customization'}
                            {include file="catalog/_partials/product-customization.tpl" customizations=$product.customizations}
                        {/block}
                    {/if}
{if $product.availability == 'available' or $product.availability == 'last_remaining_items'}
<div class="product-actions">
                        {block name='product_buy'}
                            <form action="{$urls.pages.cart}" method="post" id="add-to-cart-or-refresh">
                                <input type="hidden" name="token" value="{$static_token}">
                                <input type="hidden" name="id_product" value="{$product.id}"
                                       id="product_page_product_id">
                                <input type="hidden" name="id_customization" value="{$product.id_customization}"
                                       id="product_customization_id">

                                {block name='product_variants'}
                                    {hook h='displayProductVariants' product=$product}
                                    {include file='catalog/_partials/product-variants.tpl'}
                                {/block}

                                {block name='product_pack'}
                                    {if $packItems}
                                        <section class="product-pack">
                                            <h3 class="h4">{l s='This pack contains' d='Shop.Theme.Catalog'}</h3>
                                            {foreach from=$packItems item="product_pack"}
                                                {block name='product_miniature'}
                                                    {include file='catalog/_partials/miniatures/pack-product.tpl' product=$product_pack}
                                                {/block}
                                            {/foreach}
                                        </section>
                                    {/if}
                                {/block}

                                {block name='product_add_to_cart'}
                                    {include file='catalog/_partials/product-add-to-cart.tpl'}
                                {/block}

                                {block name='product_discounts'}
                                    {include file='catalog/_partials/product-discounts.tpl'}
                                {/block}
{block name='product_quantities'}
    {if $product.show_quantities}
        <div class="product-quantities">
            
            <span data-stock="{$product.quantity}" data-allow-oosp="{$product.allow_oosp}">{$product.quantity} {$product.quantity_label} disponible(s)</span>
        </div>
    {/if}
{/block}
                                {block name='product_additional_info'}
                                    {include file='catalog/_partials/product-additional-info.tpl'}
                                {/block}

                                {block name='product_refresh'}
                                    <input class="product-refresh ps-hidden-by-js" name="refresh" type="submit" data-url-update="false"
                                           value="{l s='Refresh' d='Shop.Theme.Actions'}">
                                {/block}
                            </form>
                        {/block}

                        {block name='hook_display_reassurance'}
				
						
                           
                        {/block}

                    </div>
                </div>
            </div>
{else}
<div class="product-actions">
	<p class="no_dispo">Disponibilité : <span class="no_dispo_text">Cet article n'est plus disponible actuellement. Nous en recevrons dans les prochaines semaines. Pour toute information contactez-nous à contact@japean.com.</span></p>
		</div>
{/if}
                    

            {if $iqitTheme.pp_sidebar}
            <div class="col-md-{$iqitTheme.pp_sidebar} sidebar product-sidebar">

                {if $iqitTheme.pp_accesories == 'sidebar'}
                    {block name='product_accessories_sidebar'}
                        {if $accessories}
                            <section class="product-accessories product-accessories-sidebar block">
                                <h4 class="block-title"><span>{l s='You might also like' d='Shop.Theme.Catalog'}</span></h4>
                                <div id="product-accessories-sidebar" class="block-content products products-grid">
                                    {foreach from=$accessories item="product_accessory"}
                                        {block name='product_miniature'}
                                            {include file='catalog/_partials/miniatures/product-small.tpl' product=$product_accessory carousel=true elementor=true}
                                        {/block}
                                    {/foreach}
                                </div>
                            </section>
                        {/if}
                    {/block}
                {/if}

                {hook h='displayRightColumnProduct'}

            </div>
            {/if}


        


        {if $iqitTheme.pp_accesories == 'footer'}
            {block name='product_accessories_footer'}
                {if $accessories}
                    <section class="product-accessories block block-section">
                        <h4 class="section-title">{l s='You might also like' d='Shop.Theme.Catalog'}</h4>
                        <div class="block-content">
                            <div class="products slick-products-carousel products-grid slick-default-carousel">
                                {foreach from=$accessories item="product_accessory"}
                                    {block name='product_miniature'}
                                        {include file='catalog/_partials/miniatures/product.tpl' product=$product_accessory carousel=true}
                                    {/block}
                                {/foreach}
                            </div>
                        </div>
						
						
                    </section>
                {/if}
            {/block}
        {/if}

        {block name='product_footer'}
            {hook h='displayFooterProduct' product=$product category=$category}
        {/block}

        {block name='product_images_modal'}
            {include file='catalog/_partials/product-images-modal.tpl'}
        {/block}

        {block name='page_footer_container'}
            <footer class="page-footer">
                {block name='page_footer'}
                    <!-- Footer content -->
                {/block}
            </footer>
        {/block}
		
    </section>
{/block}
	 <div>
		<div class="fb-comments" data-href="{$product.url}" order_by="reverse_time" data-width="100%" data-numposts="5">
        </div>
			</div>
