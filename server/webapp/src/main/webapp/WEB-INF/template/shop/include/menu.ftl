<!--Menu-->
<nav class="store-navigation group">
	<ul class="store-tabs menu">
		[@product_category_root_list count = 4]
			[#list productCategories as rootProductCategory]
			
				<li class="tab store-tab women-tab has-menu [#if currentRootCategory?? && currentRootCategory.id == rootProductCategory.id] selected [/#if]" data-gilt-tracking="${rootProductCategory.name}">
					<a class="nav-label tab-label login-reg-wall-override" href="${base}${rootProductCategory.path}" data-gilt-test="women"  data-gilt-track-action="tab|women">${rootProductCategory.name}</a>
					
				</li>
			[/#list]
		[/@product_category_root_list]
	</ul>

	<form id="productSearchForm" class="search search-form group global-search " action="${base}/product/search.jhtml">
		<input class="search-input" type="search" name="keyword" tabindex="1" autocomplete="off" placeholder="Search" value="${productKeyword!message("shop.header.keyword")}" data-gilt-test="input-search" />
		<button class="search-submit" type="submit" data-gilt-test="button-search"><span class="search-submission-text">Search</span></button>
	</form>
</nav>
<!--Menu end-->