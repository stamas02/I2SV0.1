class TestController < ApplicationController
  def index

  end
  def create
    received_img = params[:fileToUpload];


    blob = received_img.read;

    open('image.jpg', 'wb') do |file|
      file << blob
    end

    require 'unirest'

    require "net/http"
    require "uri"
    require 'json'


=begin
    uri = URI.parse("http://www.google.com/search?tbs=sbi:AMhZZiswXDC9k7oJdqpKF7gS4QF1xASj-zQBd5qSKyD1ujUoFA09D56SwnGprySx3d65YjPbwA9mUxAostwRyEcFNi-j77io02iCPbfrDTOShznuO3_1jtAWa9cgna03ZsXm1Vu2gU9WtL0_1-mfkeEqiBya1Sgn_1NCjfEPfKbW2rczqWP9chg3TQ4Nl43zCLo-hneOMzbR51GnvlbYldcPsPIdZDUq4Ks9luRCfW1RjYliPS70impKl3EkgBiO69t6KJ0sCR4rIkeeOEpmNBNMdNo4lzZyU-A5CzWDkI5xlymdi-jpqg6ON88xEW6W5D7zUfkjwjaGaS9GyJUrceP2mUAAQLqScF4u4wPEO94Xyx0E6ElTBDPxdLhAkZK71m2Eg4EIo3gT1hvrZ0x5ggunrPjIMkSixZvvhTedmIZ1BD0B6HG8RF-Xz0fGEmACQfMUJ6dn2QlBfQLQiI5Wvpbum0zbBmStgSgFcet_1luESeec9GYZusPzfOeYuyt3LmOYjxS6FQub1p8sRXUR2YrCb2CdeuhA527JtqyNcoVXB3qpG5eeuRqkYe7nTcnNqbWLt0TkvSkzfsdSfN69boeYSi8gMk9SdnZzLho5k-qFdZyfLT9Rlyt_1yUQGdBFEhY0jL5Og19IUU9_1NAhSo6fB0k9iyujpjL9VHbdC8YRZWytJJWHiQ-qNs1DWm-qHf50vIoddUxiCkIUFh5IcxVDOXkaudpuW8E2GLrj5t40yO4myoNbMsowAYKtehikmzaZ8Lgl-xtvMq9ke4GltRgnLkfoW2AWVCWTwydst2uKknx_1r6K7ckff2kvdoWKfmvvfKt9cMyHvkmhgCPiCdmzme-yBVxQ489iYbCaZ5v-05WHwX5k2QirZUoQBoTSS3mFCIrdW3gTSQMjoG98FGhYntNWEdJScVEDGab6AG7FbTvovVYT1nH79VElsG39rV6ajufRCpwdSxrU1sT-yBiaLD_1KMB-IZaw4NM6NpJEg2Sa0fLfV3DMZWX3vmj2FuUDizN-G5GzlxtfC3lKaaH9-bhi5yvGQqHX0NgS_1m7nL_1TDIZnlWWWhJQY7-XaMJSaj5oUfnmbVk7pduNZKfyyyDr05E-XWTvnqsG3jnI9hGXmAZs4Sut_1s8sjvtmRzHapqQ_1n1YC08JQxzNf5gD_1W1q3DNTCHR_1sCUUb_1sH6fRVWV3UaeS5fUiuHGnvQTjihS2ManIsC6rEzCP9hjlAme5X0eAJosJWpTl2quTxHg37usCXEIfHW5fN6YvJuuiJP1KMEFKhYngrazjXfG8rc9CzXcIUTNNatRhEx2y5BqwEylsW6My01_13TtLuVtbUnbstxiWrAB9B_1vZI1K0O6up-RxVWFzCT_1LkORhfMvKMK3smV148lD9V_1D2VPjF_1SvK-2db0-VGRMs6rTpxiY&btnG=Search%20by%20image&gws_rd=ssl&nord=1")
    http = Net::HTTP.new(uri.host)
    http.head('/',
              {
                  "Cookie"   => "SID=DQAAAP4AAABcLt8IaNzS-XgekHNg-OgqmqLPcNqA6t00EzfAUfCTw5A7AjowANtExbI_emQTZwfMdLeR42W3OqiAUcZrXCkndWby7Ex9qvNXiYBAnON7AfilY2Z3dwI2_lqJ4Srcj-I1xbsksSAqjJ076ZpStUL6_YUDekc7XyUbOdsQg8M8B_CiWht856X3A-3joNrHJ6tf71_-2WSv1Y0-C-fnnW9RN_ku1ODkTULKEDVPqnQs8CYfkQaDXdUKjgjne1x-pmh_aIcS4AAmoO9PBvkM_cEc7500E_iFF4yY6GlJ2Vw_xGpZivIXQoea2tY3dIr4QDyjq6tXLGn8ntWgU-S20rXr; HSID=AA7eK5pLJHRNW_2tI; APISID=yAb0lUzuxqNt4oLu/ArAfG2hFYA8pUl2Qz",
                  "X-Client-Data" => 'CJG2yQEIpLbJAQiptskBCN6WygE=\r\n',
                  "Accept-Encoding" => 'gzip,deflate,sdch\r\n',
                  "User-Agent" => 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36\r\n',
                  'Accept-Encoding' => 'gzip,deflate,sdch\r\n',
                  'Accept-Language' => 'en-GB,en-US;q=0.8,en;q=0.6\r\n',
                  'Accept' => 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8\r\n',
              },
    )
    #http.add_field("user-agent", 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36\r\n')
    #http.add_field("Accept-Encoding", 'gzip,deflate,sdch\r\n')
    #http.add_field("Accept", 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8\r\n')

    request = Net::HTTP::Get.new(uri.request_uri)

    response = http.request(request)

    index1 = response.body.index('HREF="')+11
    index2 = response.body.index('">here')
    link = response.body[index1, index2-index1]
=end
    # These code snippets use an open-source library. http://unirest.io/ruby
    #Unirest.user_agent('Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36\r\n')
    response = Unirest.post "http://www.google.co.uk/searchbyimage/upload",
                            headers:{ "Accept" => "application/json" },
                            parameters:{ :encoded_image => File.new("image.jpg", 'rb')}

    index1 = response.body.index('HREF="')+11
    index2 = response.body.index('">here')
    link = response.body[index1, index2-index1]

    Unirest.clear_default_headers()
    Unirest.default_header("User-agent" , 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36')

    response = Unirest.get 'http:' + link,
                            headers:{
                            "Cookie"   => "SID=DQAAAP4AAABcLt8IaNzS-XgekHNg-OgqmqLPcNqA6t00EzfAUfCTw5A7AjowANtExbI_emQTZwfMdLeR42W3OqiAUcZrXCkndWby7Ex9qvNXiYBAnON7AfilY2Z3dwI2_lqJ4Srcj-I1xbsksSAqjJ076ZpStUL6_YUDekc7XyUbOdsQg8M8B_CiWht856X3A-3joNrHJ6tf71_-2WSv1Y0-C-fnnW9RN_ku1ODkTULKEDVPqnQs8CYfkQaDXdUKjgjne1x-pmh_aIcS4AAmoO9PBvkM_cEc7500E_iFF4yY6GlJ2Vw_xGpZivIXQoea2tY3dIr4QDyjq6tXLGn8ntWgU-S20rXr; HSID=AA7eK5pLJHRNW_2tI; APISID=yAb0lUzuxqNt4oLu/ArAfG2hFYA8pUl2Qz",
                            "X-Client-Data" => 'CJG2yQEIpLbJAQiptskBCN6WygE=',
                            "accept-encoding" => 'gzip,deflate',
                            'Accept-Language' => 'en-GB,en-US;q=0.8,en;q=0.6',
                            'Accept' => 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8',
                            "User-agent" => 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36',
                            "Avail-Dictionary" => "bDnor-ss",
                            "Connection:" => "keep-alive"
                            },
                            parameters:{
                            }




    #render :text => response.body


    guess_index = response.body.index('Best guess for this image:')
    guess = ''

    if guess_index != nil
      guess_pos1 = response.body.index(">", guess_index)+1
      guess_pos2 = response.body.index('</', guess_pos1)
      guess = response.body[guess_pos1,guess_pos2-guess_pos1]
      #response.body.length-(response.body.length-guess_pos2)]
    end


    similar_index = response.body.index('<div class="_Icb _kk _wI">')

    if similar_index != nil
      similar_pos1 = response.body.index('href="', similar_index)+6
      similar_pos2 = response.body.index('">', similar_pos1)
      similar_url = response.body[similar_pos1,similar_pos2-similar_pos1]
    end

    ##render :text => '%' + 'http://www.google.com' + similar_url +  '%'

    #render :text =>  similar_url.index('&amp').to_s

    similar_url = similar_url.gsub('&amp;', '&') # we need this cause for an unknown reason in the string & is replaced by the html couterpert &amp; which results an invalid query

    response = Unirest.get 'http://www.google.com' + similar_url,
                           headers:{
                               "Cookie" => "SID=DQAAAP4AAABcLt8IaNzS-XgekHNg-OgqmqLPcNqA6t00EzfAUfCTw5A7AjowANtExbI_emQTZwfMdLeR42W3OqiAUcZrXCkndWby7Ex9qvNXiYBAnON7AfilY2Z3dwI2_lqJ4Srcj-I1xbsksSAqjJ076ZpStUL6_YUDekc7XyUbOdsQg8M8B_CiWht856X3A-3joNrHJ6tf71_-2WSv1Y0-C-fnnW9RN_ku1ODkTULKEDVPqnQs8CYfkQaDXdUKjgjne1x-pmh_aIcS4AAmoO9PBvkM_cEc7500E_iFF4yY6GlJ2Vw_xGpZivIXQoea2tY3dIr4QDyjq6tXLGn8ntWgU-S20rXr; HSID=AA7eK5pLJHRNW_2tI; APISID=yAb0lUzuxqNt4oLu/ArAfG2hFYA8pUl2Qz",
                               "X-Client-Data" => 'CJG2yQEIpLbJAQiptskBCN6WygE=',
                               "accept-encoding" => 'gzip,deflate',
                               'Accept-Language' => 'en-GB,en-US;q=0.8,en;q=0.6',
                               'Accept' => 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8',
                               "User-agent" => 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36',
                               "Avail-Dictionary" => "bDnor-ss",
                               "Connection:" => "keep-alive"
                           },
                           parameters:{
                           }



   descriptions = '{"images":['
   next_description_index = response.body.index('<div class="rg_meta">')

   while next_description_index != nil
     next_description_index += 21
     description_end_index = response.body.index('</div>', next_description_index)

     descriptions += response.body[next_description_index,description_end_index-next_description_index] + ','

     next_description_index = response.body.index('<div class="rg_meta">', next_description_index+1)

   end
    descriptions = descriptions[0...-1] #remove the last comma
    descriptions += ']}'

   data = JSON.parse(descriptions)
   words = Array.new

    data['images'].each do |img|

      name = img['fn']
      description  = img['pt']
      replacements = [ ["-", " "], ["_", " "], [",", " "], [".", " "], ["@", " "], ["–", " "], ["|", " "], ["+", " "] ]
      to_delete = [ "0", "1", "2", "3", "4", "5", "6", "7", "8", "9" , " a ", " of ", " the ", "iamge", "jpg", "png", "picture"]
      [name, description].each {|str|
        replacements.each {|replacement| str.gsub!(replacement[0], replacement[1])}
        to_delete.each {|delete| str.gsub!(delete, '')}
        tmp_str=''
        str.length.times do |i|
          tmp_str += ' ' if ( /[[:upper:]]/.match(str[i]) ) and (/[[:lower:]]/.match(str[i]))
          tmp_str +=str[i]
        end
        str = tmp_str
        tmp_str.split(' ').each {|word|
          words.push(word) if ((word != ' ')||(word != ''))
          word.downcase!
        }
      }
    end

    nounlist=File.open('nounlist').read
    nounlist.gsub!(/\r\n?/, "\n")

    words_frequency_map = Array.new
    words.each {|new_word|
      found = false;
      words_frequency_map.each {|word_frequency|
        if new_word == word_frequency[0]
          word_frequency[1] +=1
          found = true
          break
        elsif new_word.include? word_frequency[0]
          word_frequency[1] +=1
        end
      }

      if (found == false)
        nounlist.each_line {|noun|
          noun.gsub!("\n","")
          if ((new_word == noun)||(new_word == noun + 's'))
            puts noun if (new_word == 'sitting')
            words_frequency_map.push([new_word,1])
            break
          end
        }
      end


    }

   #normalise result

  words_frequency_map.each {|reference_word|
    words_frequency_map.each {|compared_word|
      reference_word[1] += compared_word[1] if ((compared_word[0].include? reference_word[0])&&(compared_word[0] != reference_word[0]))
    }
  }

  most_frequent_word = words_frequency_map[0]
  words_frequency_map.each {|word|
    most_frequent_word = word if most_frequent_word[1] < word[1]
  }


    if (guess != '')
      render :text =>  "There is a " + guess + " in the picture"
    else
      render :text =>  "There is a " + most_frequent_word[0] + " in the picture"
    end






=begin
    response = Unirest.get 'http://images.google.com/searchbyimage?image_url=https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcREkTfuN2foI3juaxXNYGNb5zJTGC4yzCaXZm09ouOLsy_rgbOV',
    response.outh ({}).end();


    render :text =>  '  ' + response.body

=end

    "
    require 'net/http/post/multipart'

    url = URI.parse('http://www.google.co.uk/searchbyimage/upload')

      req = Net::HTTP::Post::Multipart.new url.path,
                                           'encoded_image' => UploadIO.new('image.jpg', 'image/jpeg', 'image.jpg')
      res = Net::HTTP.start(url.host, url.port) do |http|
        http.request(req)
      end

    index1 = res.body.index('HREF="')+6
    index2 = res.body.index('">here')
    link = res.body[index1, index2-index1]




    url2 = URI.parse(link)
    req2 = Net::HTTP::Get.new(url2.to_s)
    res2 = Net::HTTP.start(url2.host, url2.port) {|http2|
      http2.request(req2)
    }

    render :text => res2.body


"
    " require 'net/http'
    render :text => blob;

    uri = URI('http://www.google.co.uk/searchbyimage/upload')
    req = Net::HTTP::Post.new('http://www.google.co.uk/searchbyimage/upload')
    req.body = 'encoded_image' + blob
    req.content_type = 'multipart/form-data'

    res = Net::HTTP.start(uri.hostname, uri.port) do |http|
      http.request(req)
    end"

  end


end