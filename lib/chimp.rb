require 'xmlrpc/client'

class Chimp
  def initialize
    @config = Nesta::Configuration.mailchimp
    @client = XMLRPC::Client.new2(@config['url'])
    @api_key = @client.call("login", @config['username'].to_s, @config['password'].to_s)
  end
  
  def add(email)
    # Clean the email address, never know what people try to input
    email_regex = /\b[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}\b/
    sanitized_email = email.match(email_regex)[0]
    chimp_subscribe(@auth, @config['listid'], sanitized_email)
  end
  
  private
    def chimp_subscribe(auth, mailing_list_id, email, merge_vars=[],
                                  email_content_type="html", double_optin=false)
      begin
        @client.call('listSubscribe', 
                    @api_key,
                    mailing_list_id, 
                    email, 
                    merge_vars, 
                    email_content_type, 
                    double_optin)
      rescue XMLRPC::FaultException => e
        # Something bad happened
        # Merb.logger e.faultCode
        # Merb.logger e.faultString
      end
    end
end
