!function(){var t;t=jQuery,t.fn.flexNav=function(e){var n,i,s,a,o,l,h,r,u,d,c,v;return u=t.extend({animationSpeed:250,transitionOpacity:!0,buttonSelector:".menu-button",hoverIntent:!1,hoverIntentTimeout:150,calcItemWidths:!1,hover:!0},e),n=t(this),n.addClass("with-js"),u.transitionOpacity===!0&&n.addClass("opacity"),n.find("li").each(function(){return t(this).has("ul").length?t(this).addClass("item-with-ul").find("ul").hide():void 0}),u.calcItemWidths===!0&&(i=n.find(">li"),a=i.length,l=100/a,o=l+"%"),n.data("breakpoint")&&(s=n.data("breakpoint")),d=function(){return n.hasClass("lg-screen")===!0&&u.hover===!0?u.transitionOpacity===!0?t(this).find(">ul").addClass("flexnav-show").stop(!0,!0).animate({height:["toggle","swing"],opacity:"toggle"},u.animationSpeed):t(this).find(">ul").addClass("flexnav-show").stop(!0,!0).animate({height:["toggle","swing"]},u.animationSpeed):void 0},h=function(){return n.hasClass("lg-screen")===!0&&t(this).find(">ul").hasClass("flexnav-show")===!0&&u.hover===!0?u.transitionOpacity===!0?t(this).find(">ul").removeClass("flexnav-show").stop(!0,!0).animate({height:["toggle","swing"],opacity:"toggle"},u.animationSpeed):t(this).find(">ul").removeClass("flexnav-show").stop(!0,!0).animate({height:["toggle","swing"]},u.animationSpeed):void 0},r=function(){var e;if(t(window).width()<=s)return n.removeClass("lg-screen").addClass("sm-screen"),u.calcItemWidths===!0&&i.css("width","100%"),e=u.buttonSelector+", "+u.buttonSelector+" .touch-button",t(e).removeClass("active"),t(".one-page li a").on("click",function(){return n.removeClass("flexnav-show")});if(t(window).width()>s){if(n.removeClass("sm-screen").addClass("lg-screen"),u.calcItemWidths===!0&&i.css("width",o),n.removeClass("flexnav-show").find(".item-with-ul").on(),t(".item-with-ul").find("ul").removeClass("flexnav-show"),h(),u.hoverIntent===!0)return t(".item-with-ul").hoverIntent({over:d,out:h,timeout:u.hoverIntentTimeout});if(u.hoverIntent===!1)return t(".item-with-ul").on("mouseenter",d).on("mouseleave",h)}},t(u.buttonSelector).data("navEl",n),v=".item-with-ul, "+u.buttonSelector,t(v).append('<span class="touch-button"><i class="navicon">&#9660;</i></span>'),c=u.buttonSelector+", "+u.buttonSelector+" .touch-button",t(c).on("click",function(e){var n,i,s;return t(c).toggleClass("active"),e.preventDefault(),e.stopPropagation(),s=u.buttonSelector,n=t(this).is(s)?t(this):t(this).parent(s),i=n.data("navEl"),i.toggleClass("flexnav-show")}),t(".touch-button").on("click",function(){var e,i;return e=t(this).parent(".item-with-ul").find(">ul"),i=t(this).parent(".item-with-ul").find(">span.touch-button"),n.hasClass("lg-screen")===!0&&t(this).parent(".item-with-ul").siblings().find("ul.flexnav-show").removeClass("flexnav-show").hide(),e.hasClass("flexnav-show")===!0?(e.removeClass("flexnav-show").slideUp(u.animationSpeed),i.removeClass("active")):e.hasClass("flexnav-show")===!1?(e.addClass("flexnav-show").slideDown(u.animationSpeed),i.addClass("active")):void 0}),n.find(".item-with-ul *").focus(function(){return t(this).parent(".item-with-ul").parent().find(".open").not(this).removeClass("open").hide(),t(this).parent(".item-with-ul").find(">ul").addClass("open").show()}),r(),t(window).on("resize",r)}}.call(this);