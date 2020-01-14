{**
 * 2007-2017 PrestaShop
 *
 * NOTICE OF LICENSE
 *
 * This source file is subject to the Academic Free License 3.0 (AFL-3.0)
 * that is bundled with this package in the file LICENSE.txt.
 * It is also available through the world-wide-web at this URL:
 * https://opensource.org/licenses/AFL-3.0
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
 * @license   https://opensource.org/licenses/AFL-3.0 Academic Free License 3.0 (AFL-3.0)
 * International Registered Trademark & Property of PrestaShop SA
 *}
{block name='product_miniature_item'}
  <article class="{if isset($smarty.cookies.show_list)}product_show_list {/if}product-item product-miniature js-product-miniature {if isset($roythemes.pl_lay) && $roythemes.pl_lay == "3"}pl_lay3{/if} col-lg-4 col-md-6 col-sm-6 col-xs-12" data-id-product="{$product.id_product}" data-id-product-attribute="{$product.id_product_attribute}" itemscope itemtype="http://schema.org/Product">
    <div class="thumbnail-container">
      <div class="product-image">
        {block name='product_thumbnail'}
          <a href="{$product.url}" class="thumbnail product-thumbnail noeffect">
            <img
              src = "{$product.cover.bySize.home_default.url}"
              alt = "{if !empty($product.cover.legend)}{$product.cover.legend}{else}{$product.name|truncate:30:'...'}{/if}"
              data-full-size-image-url = "{$product.cover.large.url}"
            >
            {if isset($roythemes.nc_second_img) && $roythemes.nc_second_img == "1"}
              {if isset($product.images[1])}
                {assign var=royurl0 value={$product.images[0].bySize.home_default.url}}
                {assign var=royurl1 value={$product.images[1].bySize.home_default.url}}
                {assign var=royurlc value={$product.cover.bySize.home_default.url}}
                {if $royurl1 == $royurlc}{assign var=royurlsec value={$royurl0}}{else}{assign var=royurlsec value={$royurl1}}{/if}
                <img class="roy_secondimg" src="{$royurlsec}"
                     alt="{if !empty($product.cover.legend)}{$product.cover.legend}{else}{$product.name|truncate:30:'...'}{/if}"
                >
              {/if}
            {/if}
          </a>
        {/block}

        {if isset($roythemes.pl_hover_lay) && $roythemes.pl_hover_lay == "1"}
          <div class="subaction hidden-sm-down">
            {hook h='displayFavButton' product_id=$product.id}
            {block name='quick_view'}
              <a class="quick-view tip_inside noeffect" href="#" data-link-action="quickview">
                <i class="rts" data-size="24" data-color="#000000">{if isset($roythemes.nc_i_qv)}{$roythemes.nc_i_qv}{else}search1{/if}</i>
                <span class="tip">{l s='Quick view' d='Shop.Theme.Actions'}</span>
              </a>
            {/block}
          </div>
        {/if}

        <div class="action-block highlighted-informations{if !$product.main_variants} no-variants{/if} hidden-sm-down">

          {if !$configuration.is_catalog}
            <div class="add_wrap">
              {if ($product.allow_oosp || (!$product.main_variants && $product.quantity > 0) || $product.quantity_all_versions > 0)}
                {if isset($roythemes.nc_ai) && $roythemes.nc_ai == "1"}
                  {if $product.id_product_attribute > 0}
                    <input type="hidden" name="token" value="{$static_token}">
                    <input type="hidden" value="{$product.id_product}" name="id_product">
                    <input type="hidden" name="id_customization" value="0">
                    <a href="{$product.url}" class="action-btn add_to_cart noeffect {if isset($roythemes.pl_hover_lay) && $roythemes.pl_hover_lay == "2"}tip_inside{/if}">
                      {if isset($roythemes.pl_hover_lay) && $roythemes.pl_hover_lay == "2"}<i class="rts" data-size="24" data-color="#000000">{if isset($roythemes.nc_i_discover)}{$roythemes.nc_i_discover}{else}discover1{/if}</i>{/if}
                      <span {if isset($roythemes.pl_hover_lay) && $roythemes.pl_hover_lay == "2"}class="tip"{/if}>{l s='Select Options' d='Shop.Theme.Actions'}</span>
                    </a>
                  {else}
                    <form action="{$urls.pages.cart}" method="post">
                      <input type="hidden" name="token" value="{$static_token}">
                      <input type="hidden" value="{$product.id_product}" name="id_product">
                      <input type="hidden" name="id_customization" value="0">
                      <a data-button-action="add-to-cart" class="action-btn add_to_cart noeffect {if isset($roythemes.pl_hover_lay) && $roythemes.pl_hover_lay == "2"}tip_inside{/if}" href="#">
                        {if isset($roythemes.pl_hover_lay) && $roythemes.pl_hover_lay == "2"}<i class="rts" data-size="24" data-color="#000000">{if isset($roythemes.cart_icon)}{$roythemes.cart_icon}{else}cart1{/if}</i>{/if}
                        <span {if isset($roythemes.pl_hover_lay) && $roythemes.pl_hover_lay == "2"}class="tip"{/if}>{l s='Add to cart' d='Shop.Theme.Actions'}</span>
                      </a>
                    </form>
                  {/if}
                {else}
                  <form action="{$urls.pages.cart}" method="post">
                    <input type="hidden" name="token" value="{$static_token}">
                    <input type="hidden" value="{$product.id_product}" name="id_product">
                    <input type="hidden" name="id_customization" value="0">
                    <a data-button-action="add-to-cart" class="action-btn add_to_cart noeffect {if isset($roythemes.pl_hover_lay) && $roythemes.pl_hover_lay == "2"}tip_inside{/if}" href="#">
                      {if isset($roythemes.pl_hover_lay) && $roythemes.pl_hover_lay == "2"}<i class="rts" data-size="24" data-color="#000000">{if isset($roythemes.cart_icon)}{$roythemes.cart_icon}{else}cart1{/if}</i>{/if}
                      <span {if isset($roythemes.pl_hover_lay) && $roythemes.pl_hover_lay == "2"}class="tip"{/if}>{l s='Add to cart' d='Shop.Theme.Actions'}</span>
                    </a>
                  </form>
                {/if}
              {else}
                <form action="{$urls.pages.cart}" method="post">
                  <input type="hidden" name="token" value="{$static_token}">
                  <input type="hidden" value="{$product.id_product}" name="id_product">
                  <a data-button-action="add-to-cart" class="action-btn disabled noeffect {if isset($roythemes.pl_hover_lay) && $roythemes.pl_hover_lay == "2"}tip_inside{/if}" disabled href="#">
                    {if isset($roythemes.pl_hover_lay) && $roythemes.pl_hover_lay == "2"}<i class="rts" data-size="24" data-color="#000000">{if isset($roythemes.cart_icon)}{$roythemes.cart_icon}{else}cart1{/if}</i>{/if}
                    <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-x"><line x1="18" y1="6" x2="6" y2="18"></line><line x1="6" y1="6" x2="18" y2="18"></line></svg><span {if isset($roythemes.pl_hover_lay) && $roythemes.pl_hover_lay == "2"}class="tip"{/if}>{l s='Out of stock' d='Shop.Theme.Actions'}</span>
                  </a>
                </form>
              {/if}
            </div>
          {/if}

          {if isset($roythemes.pl_hover_lay) && $roythemes.pl_hover_lay == "2"}
            {block name='quick_view'}
              <a class="quick-view action-btn tip_inside noeffect" href="#" data-link-action="quickview">
                <i class="rts" data-size="24" data-color="#000000">{if isset($roythemes.nc_i_qv)}{$roythemes.nc_i_qv}{else}search1{/if}</i>
                <span class="tip">{l s='Quick view' d='Shop.Theme.Actions'}</span>
              </a>
            {/block}
          {/if}

          {if isset($roythemes.pl_hover_lay) && $roythemes.pl_hover_lay == "2"}
            {hook h='displayFavButton' product_id=$product.id}
          {/if}

        </div>

        {if isset($product.specific_prices.to) && isset($product.specific_prices.from)}
          {if ($smarty.now|date_format:'%Y-%m-%d %H:%M:%S' <= $product.specific_prices.to && $smarty.now|date_format:'%Y-%m-%d %H:%M:%S' >= $product.specific_prices.from) && ($product.specific_prices.to != '0000-00-00 00:00:00')}
            <div class="count_icon tip_inside">
              <svg version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
                   viewBox="0 0 240 240" style="enable-background:new 0 0 240 240;" xml:space="preserve">
              <g>
                <path class="hand hand-min" d="M185.4,128H120c-4.4,0-8-3.6-8-8s3.6-8,8-8h65.4c4.4,0,8,3.6,8,8S189.8,128,185.4,128z"/>
              </g>
                <g>
                  <path class="hand hand-hour" d="M120,127.2c-4.4,0-8-3.6-8-8V63.9c0-4.4,3.6-8,8-8s8,3.6,8,8v55.4C128,123.7,124.4,127.2,120,127.2z"/>
                </g>
                <path d="M120,16c57.3,0,104,46.7,104,104s-46.7,104-104,104S16,177.3,16,120S62.7,16,120,16 M120,0C53.7,0,0,53.7,0,120
              	s53.7,120,120,120s120-53.7,120-120S186.3,0,120,0L120,0z"/>
              </svg>
              <span class="tip">{l s='Limited Offer!' d='Shop.Theme.Actions'}</span>
            </div>
          {/if}
        {/if}
      </div>
      <div class="product-description">
        {if isset($roythemes.pl_lay) && $roythemes.pl_lay == "2"}
          {block name='product_reviews'}
            {hook h='displayProductListReviews' product=$product}
          {/block}
        {/if}
        {block name='product_name'}
          <h3 class="h3 product-title" itemprop="name"><a class="noeffect" href="{$product.url}"><span>{$product.name}</span></a></h3>
        {/block}
        <div class="prod-short-desc" itemprop="description">{$product.description_short nofilter}</div>
        {block name='product_price_and_shipping'}
          {if $product.show_price}
            <div class="product-price-and-shipping">
              {if $product.has_discount}
                {hook h='displayProductPriceBlock' product=$product type="old_price"}

                <span class="sr-only">{l s='Regular price' d='Shop.Theme.Catalog'}</span>
                <span class="regular-price">{$product.regular_price}</span>

              {/if}

              {hook h='displayProductPriceBlock' product=$product type="before_price"}

              <span class="sr-only">{l s='Price' d='Shop.Theme.Catalog'}</span>
              <span itemprop="price" class="price">{$product.price}</span>

              {hook h='displayProductPriceBlock' product=$product type='unit_price'}

              {hook h='displayProductPriceBlock' product=$product type='weight'}
            </div>

            {block name='product_variants'}
              {if $product.main_variants}
                {include file='catalog/_partials/variant-links.tpl' variants=$product.main_variants}
              {/if}
            {/block}

            {if isset($product.specific_prices.to) && isset($product.specific_prices.from)}
              {if ($smarty.now|date_format:'%Y-%m-%d %H:%M:%S' <= $product.specific_prices.to && $smarty.now|date_format:'%Y-%m-%d %H:%M:%S' >= $product.specific_prices.from) && ($product.specific_prices.to != '0000-00-00 00:00:00')}
                <div class="countcontainer">
                  <div class="roycountdown">
                    <div class="roycount" style="display: none;" data-specific-price-to="{$product.specific_prices.to}" data-days={l s='Days'} data-hours={l s='Hours'} data-minutes={l s='Mins'} data-seconds={l s='Secs'}></div>
                    <i><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-tag"><path d="M20.59 13.41l-7.17 7.17a2 2 0 0 1-2.83 0L2 12V2h10l8.59 8.59a2 2 0 0 1 0 2.82z"></path><line x1="7" y1="7" x2="7" y2="7"></line></svg></i>
                  </div>
                </div>
              {/if}
            {/if}

          {/if}

          {if !$configuration.is_catalog}
            <div class="add_wrap hidden-lg-up">
              {if ($product.allow_oosp || (!$product.main_variants && $product.quantity > 0) || $product.quantity_all_versions > 0)}
                {if isset($roythemes.nc_ai) && $roythemes.nc_ai == "1"}
                  {if $product.id_product_attribute > 0}
                    <input type="hidden" name="token" value="{$static_token}">
                    <input type="hidden" value="{$product.id_product}" name="id_product">
                    <input type="hidden" name="id_customization" value="0">
                    <a href="{$product.url}"  class="btn btn-primary add_to_cart noeffect">
                      <span>{l s='Select Options' d='Shop.Theme.Actions'}</span>
                    </a>
                  {else}
                    <form action="{$urls.pages.cart}" method="post">
                      <input type="hidden" name="token" value="{$static_token}">
                      <input type="hidden" value="{$product.id_product}" name="id_product">
                      <input type="hidden" name="id_customization" value="0">
                      <a data-button-action="add-to-cart" class="btn btn-primary add_to_cart noeffect" href="#">
                        <span>{l s='Add to cart' d='Shop.Theme.Actions'}</span>
                      </a>
                    </form>
                  {/if}
                {else}
                  <form action="{$urls.pages.cart}" method="post">
                    <input type="hidden" name="token" value="{$static_token}">
                    <input type="hidden" value="{$product.id_product}" name="id_product">
                    <input type="hidden" name="id_customization" value="0">
                    <a data-button-action="add-to-cart" class="btn btn-primary add_to_cart noeffect" href="#">
                      <span>{l s='Add to cart' d='Shop.Theme.Actions'}</span>
                    </a>
                  </form>
                {/if}
              {else}
                <form action="{$urls.pages.cart}" method="post">
                  <input type="hidden" name="token" value="{$static_token}">
                  <input type="hidden" value="{$product.id_product}" name="id_product">
                  <a data-button-action="add-to-cart" class="btn btn-primary disabled noeffect" disabled href="#">
                    <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-x"><line x1="18" y1="6" x2="6" y2="18"></line><line x1="6" y1="6" x2="18" y2="18"></line></svg><span>{l s='Out of stock' d='Shop.Theme.Actions'}</span>
                  </a>
                </form>
              {/if}
            </div>
          {/if}
        {/block}

        {if isset($roythemes.pl_lay) && $roythemes.pl_lay !== "2"}
          {block name='product_reviews'}
            {hook h='displayProductListReviews' product=$product}
          {/block}
        {/if}
      </div>

      {block name='product_flags'}
        <ul class="product-flags">
          {if ($product.allow_oosp || (!$product.main_variants && $product.quantity > 0) || $product.quantity_all_versions > 0)}{else}
            <li class="product-flag">{l s='Out of stock' d='Shop.Theme.Actions'}</li>
          {/if}

          {if $product.show_price}
            {if $product.has_discount}
              {if $product.discount_type === 'percentage'}
                <li class="discount-percentage discount-product">{$product.discount_percentage}</li>
              {elseif $product.discount_type === 'amount'}
                <li class="discount-amount discount-product">{$product.discount_amount_to_display}</li>
              {/if}
            {/if}
          {/if}
          {foreach from=$product.flags item=flag}
            <li class="product-flag {$flag.type}">{$flag.label}</li>
          {/foreach}
        </ul>
      {/block}

    </div>
  </article>
{/block}
