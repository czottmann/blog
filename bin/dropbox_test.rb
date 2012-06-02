require "dropbox_sdk"
require "awesome_print"

APP_KEY = "qvkvz5uswjkba9a"
APP_SECRET = "ngukx8flf5fma56"
ACCESS_TYPE = :app_folder

stored_session = <<EOYAML
---
- 3kvxhpkyr51xyve
- zg05rif0f4hbtah
- jwve0iy2jashyjm
- 7k4vwf8ox7fowxu
- ngukx8flf5fma56
- qvkvz5uswjkba9a
EOYAML


if stored_session
  session = DropboxSession.deserialize(stored_session)
  session.get_access_token
else
  session = DropboxSession.new( APP_KEY, APP_SECRET )

  session.get_request_token
  authorize_url = session.get_authorize_url

  # Make the user sign in and authorize this token
  puts "AUTHORIZING", authorize_url
  puts "Please visit that website and hit 'Allow', then hit Enter here."
  gets

  # This will fail if the user didn't visit the above URL and hit 'Allow'
  session.get_access_token
end


client = DropboxClient.new( session, ACCESS_TYPE )
puts "linked account:", client.account_info().inspect

file_metadata = client.get_file_and_metadata("/2012-01-01-17-28-03.json")
ap file_metadata
