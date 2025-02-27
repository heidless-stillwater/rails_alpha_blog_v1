require 'digest'
require 'uri'
 
# Assume you manually set the email_address here or get it from user input
email_address = 'rob.lockhart@yahoo.co.uk'.downcase
 
# Create the SHA256 hash
hash = Digest::SHA256.hexdigest(email_address)
 
# Set default URL and size parameters
default = "https://www.example.com/default.jpg"
size = 200
 
# Compile the full URL with URI encoding for the parameters
params = URI.encode_www_form('d' => default, 's' => size)
image_src = "https://www.gravatar.com/avatar/#{hash}?#{params}"
 
# This 'image_src' can now be used in an <img> tag or wherever needed
puts image_src  # Example to output the result
