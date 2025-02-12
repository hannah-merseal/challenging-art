# Load necessary library
if (!require("magick")) install.packages("magick", dependencies = TRUE)
library(magick)

# Define source and destination folders
source_folder <- "TRT-main"
destination_folder <- "standardized"

# Create the destination folder if it doesn't exist
if (!dir.exists(destination_folder)) {
  dir.create(destination_folder)
}

# Get a list of all files in the source folder
image_files <- list.files(source_folder, full.names = TRUE)

# Process each image and save it as a .png in the destination folder
for (file in image_files) {
  # Read the image using magick
  img <- image_read(file)
  
  # Generate the new filename with .png extension
  new_filename <- file.path(destination_folder, paste0(tools::file_path_sans_ext(basename(file)), ".png"))
  
  # Write the image as a .png file
  image_write(img, path = new_filename, format = "png")
  
  cat("Converted:", basename(file), "->", new_filename, "\n")
}

cat("All images have been converted and saved in the 'standardized' folder.\n")
