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

<div id="mobile-header-sticky">
    <div class="container">
        <div class="mobile-main-bar">
            <div class="row no-gutters align-items-center row-mobile-header">
                <div class="col col-mobile-logo">
                    <a href="{$urls.base_url}">
                        <img class="logo img-fluid"
                             src="{$shop.logo}" {if isset($iqitTheme.rm_logo) && $iqitTheme.rm_logo != ''} srcset="{$iqitTheme.rm_logo} 2x"{/if}
                             alt="{$shop.name}">
                    </a>
                </div>
				<div class="block_add_mobile">
                <div id="mobile-btn-search" class="col col-auto col-mobile-btn col-mobile-btn-search">
                    <a  class="m-nav-btn" data-toggle="dropdown"><i class="fa fa-search" aria-hidden="true"></i>
                        <span>{l s='Search' d='Shop.Theme.Global'}</span></a>
                    <div class="dropdown-content dropdown-menu dropdown-mobile search-widget">
                        <form method="get" action="{$urls.pages.search}">
                            <input type="hidden" name="controller" value="search">
                            <div class="input-group">
                                <input type="text" name="s" value=""
                                       placeholder="{l s='Search' d='Shop.Theme.Catalog'}" class="form-control form-search-control">
                                <button type="submit" class="search-btn">
                                    <i class="fa fa-search"></i>
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="col col-auto col-mobile-btn col-mobile-btn-account">
                    <a href="{$urls.pages.my_account}" class="m-nav-btn"><i class="fa fa-user" aria-hidden="true"></i>
                        <span>{l s='Sign in' d='Shop.Theme.Actions'}</span></a>
                </div>
                {if !$configuration.is_catalog}
                <div
                     class="col col-auto col-mobile-btn col-mobile-btn-cart ps-shoppingcart {if isset($iqitTheme.cart_style) && $iqitTheme.cart_style == "floating"}dropdown{else}side-cart{/if}">
                    <div id="mobile-cart-wrapper">
                        <a id="mobile-cart-toogle" class="m-nav-btn" data-toggle="dropdown"><i class="fa fa-shopping-bag mobile-bag-icon"
                                                                                          aria-hidden="true"><span id="mobile-cart-products-count" class="cart-products-count cart-products-count-btn">{$cart.products_count}</span></i>
                            <span>{l s='Cart' d='Shop.Theme.Checkout'}</span></a>
                        <div id="_mobile_blockcart-content"></div>
                    </div>
                </div>
                {/if}
                <div class="col col-auto col-mobile-btn col-mobile-btn-menu col-mobile-menu-{$iqitTheme.mm_type}">
                    <a class="m-nav-btn" data-toggle="dropdown"><i class="fa fa-bars" aria-hidden="true"></i>
                        <span>{l s='Menu' d='Shop.Theme.Global'}</span></a>
                    <div id="_mobile_iqitmegamenu-mobile"></div>
                </div>
					</div>
            </div>
        </div>
    </div>
</div>
