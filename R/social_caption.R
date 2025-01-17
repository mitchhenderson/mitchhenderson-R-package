#' Create a ggplot caption with social media details
#'
#' @param linkedin_name Name on LinkedIn
#' @param bluesky_username Bluesky username
#' @param github_username GitHub username
#' @param font_family Font to use for social media handles
#' @param icon_colour Hex colour code for icons
#' @param font_colour Hex colour code for social media handles
#'
#' @returns A character vector
#' @export
#'
#' @examples
#' socials <- social_caption(
#'   linkedin_name = "Mitch Henderson",
#'   bluesky_username = "mitchhenderson",
#'   github_username = "mitchhenderson"
#'   )
social_caption <- function(linkedin_name = "Mitch Henderson",
                           bluesky_username = "mitchhenderson",
                           github_username = "mitchhenderson",
                           font_family = "Segoe UI",
                           icon_colour = "#134A8E",
                           font_colour = "grey20") {
  glue::glue(
    "<span style='font-family:\"Font Awesome 6 Brands\";color: {icon_colour}'>&#xf08c;</span> <span style='font-family: \"{font_family}\";color: {font_colour}'>{linkedin_name}</span>
     <span style='font-family:\"Font Awesome 6 Brands\";color: {icon_colour}'>&#xe671;</span> <span style='font-family: \"{font_family}\";color: {font_colour}'>{bluesky_username}</span>
     <span style='font-family:\"Font Awesome 6 Brands\";color: {icon_colour}'>&#xf09b;</span> <span style='font-family: \"{font_family}\";color: {font_colour}'>{github_username}</span>"
  )
}
