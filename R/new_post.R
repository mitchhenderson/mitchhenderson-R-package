#' Create a new Quarto post with pre-filled YAML
#'
#' @param title Name of the post
#' @param file Name of the .qmd file generated
#' @param description Post description
#' @param author Author name (default is "Mitch Henderson")
#' @param date Date of post (default is today)
#' @param draft Default is FALSE but when TRUE the post will not be rendered due to "_" prefix added
#' @param title_limit Number of characters beyond which a warning is provided
#' @param open_file Default is TRUE meaning the .qmd file is automatically opened.
#'
#' @returns Nothing. Side effects include a newly created folder and file.
#' @export
#'
#' @examples
#' \dontrun{
#' new_post(
#'   title = "My new post",
#'   description = "My new post is about xyz",
#'   draft = TRUE
#' )
#' }
new_post <- function(
    title,
    file = "index.qmd",
    description = "",
    author = "Mitch Henderson",
    date = Sys.Date(),
    draft = FALSE,
    title_limit = 40,
    open_file = TRUE
){

  # convert to kebab case and remove non space or alphanumeric characters
  title_kebab <- stringr::str_to_lower(title) |>
    stringr::str_remove_all("[^[:alnum:][:space:]]") |>
    stringr::str_replace_all(" ", "-")

  # warn if a very long slug
  if(nchar(title_kebab) >= title_limit){
    cli::cli_alert_warning("Warning: Title slug is longer than {.val {title_limit}} characters!")
  }

  # generate the slug as draft, prefix with _ which prevents
  # quarto from rendering/recognizing the folder
  if(draft){
    slug <- glue::glue("posts/_{date}-{title_kebab}")
    cli::cli_alert_info("Appending a '_' to folder name to avoid render while a draft, remove '_' when finished.")
  } else {
    slug <- glue::glue("posts/{date}-{title_kebab}")
  }

  # create and alert about directory
  fs::dir_create(
    path = slug
  )
  cli::cli_alert_success("Folder created at {.file {slug}}")

  # wrap description at 77 characters
  description <- stringr::str_wrap(description, width = 77) |>
    stringr::str_replace_all("[\n]", "\n  ")

  # start generating file
  new_post_file <- glue::glue("{slug}/{file}")

  # build yaml core
  new_post_core <- c(
    "---",
    glue::glue('title: "{title}"'),
    "description: |",
    glue::glue('  {description}'),
    glue::glue("author: {author}"),
    glue::glue("date: {date}")
  )

  # add draft if draft
  if(draft){
    new_post_text <- c(
      new_post_core,
      "draft: true",
      "---\n"
    )
  } else {
    new_post_text <- c(
      new_post_core,
      "---\n"
    )
  }

  # finalize new post text
  new_post_text <- paste0(
    new_post_text,
    collapse = "\n"
  )

  # create file and alert
  fs::file_create(new_post_file)
  cli::cli_alert_success("File created at {.file {new_post_file}}")

  writeLines(
      text = new_post_text,
      con = new_post_file
    )

  rstudioapi::documentOpen(new_post_file, line = length(new_post_text))
}
