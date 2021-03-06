#' @title   summarize biodiversity dataframe
#' @description  Summary table function.
#'
#' @param data biodiversity dataframe
#'
#' @export
summarizeDataframe <- function(data) {
    if (nrow(data) == 0) {
        return(data)
    }
    temp_data <- as.data.frame(data)
    cols <- which(
        tolower(names(data)) %in% c(
            "scientificname",
            "taxonrank",
            "eventdate",
            "country",
            "decimallatitude",
            "decimallongitude",
            "latitude",
            "longitute"
        )
    )
    
    cols <- c(cols, setdiff(1:length(data), cols))
    
    temp_data <- data[, cols]
    hiding_cols <- c()
    temp_data[] <- lapply(temp_data, as.character)
    
    for (i in 1:length(names(temp_data))) {
        size <- ifelse(nrow(temp_data) > 1000, 1000, nrow(temp_data))
        sample <-
            sample(1:nrow(temp_data), size = size)
        f <-
            mean(sapply(temp_data[sample, i], function(x)
                nchar(x)), na.rm = T)
        
        if (!is.nan(f)) {
            if (f > 50) {
                hiding_cols <- c(hiding_cols, i)
            }
        }
    }
    
    if (length(hiding_cols) > 0) {
        temp_data <- temp_data[, c(hiding_cols * -1)]
    }
    temp_data
}

#' @title   create a core object from reactive function
#' @description  get core object if its wrapped in shiny reactives.
#'
#' @param reactiveObject shiny reactive object or, object
#'
#' @export
return_core <- function(reactiveObject) {
    if (class(reactiveObject) == "reactive" ||
        class(reactiveObject) == "reactiveExpr") {
        return(reactiveObject())
    } else {
        return(reactiveObject)
    }
}
