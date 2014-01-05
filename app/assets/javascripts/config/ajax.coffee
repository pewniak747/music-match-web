$.ajaxSetup
  beforeSend: (xhr, settings)->
    if settings.url.indexOf(gon.api_url) == 0
      if Musicmatch.request('authenticated')
        accessToken = Musicmatch.request('entities:accesstoken')
        xhr.setRequestHeader("Authorization", "Bearer #{accessToken.access_token}")
