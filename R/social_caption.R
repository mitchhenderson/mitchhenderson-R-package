social_caption <- function(linkedin_icon = "&#xf08c",
                           linkedin_name = "Mitch Henderson",
                           bluesky_icon = "&#xe671",
                           bluesky_username = "mitchhenderson",
                           github_icon = "&#xf09b",
                           github_username = "mitchhenderson",
                           font_family = "Segoe UI",
                           icon_colour = "#134A8E",
                           font_colour = "grey20") {
  glue::glue(
    "<span style='font-family:\"Font Awesome 6 Brands\";color: {icon_colour}'>{linkedin_icon};</span> <span style='font-family: \"{font_family}\";color: {font_colour}'>{linkedin_name}</span>
     <span style='font-family:\"Font Awesome 6 Brands\";color: {icon_colour}'>{bluesky_icon};</span> <span style='font-family: \"{font_family}\";color: {font_colour}'>{bluesky_username}</span>
     <span style='font-family:\"Font Awesome 6 Brands\";color: {icon_colour}'>{github_icon};</span> <span style='font-family: \"{font_family}\";color: {font_colour}'>{github_username}</span>"
  )
}
