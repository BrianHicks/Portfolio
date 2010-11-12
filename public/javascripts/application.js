// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

// in short, this just makes the slides slide
jQuery(document).ready(function() {
  jQuery(".thumb").each(function() {
    jQuery(this).click(function() {
      jQuery(this).parents(".post").find(".viewer").scrollTo("p[name=" + jQuery(this).attr("name") + "]", 500);
    })
  })
})
