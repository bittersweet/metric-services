class Service::Email < Service
  def receive_event
    p settings, site, payload
    email_address = settings
    template = html_template
    subject = "[metric.io] alert for #{payload['metric']} on #{site}"

    mail = Mail.new do
      from 'info@metric.io'
      to email_address
      subject subject
      html_part do
        content_type 'text/html; charset=UTF-8'
        body template
      end
    end
    mail.delivery_method.settings = {
      :address   => "smtp.mandrillapp.com",
      :domain    => "mandrillapp.com",
      :port      => 587,
      :user_name => 'info@metric.io',
      :password  => '5c6e8b56-d1a4-4833-9ab9-402fb7df95f8'
    }
    mail.deliver!
  end

  def html_template
    erb(<<-EOF, binding)
<html>
  <head>
    <title>Metric.io</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
  </head>
  <body style="margin:0;background:#f1f1f1;font-family:'Helvetica Neue', helvetica, arial, sans-serif;padding-bottom:30px;">
    <div style="padding:5px 30px;background:#1E1E1E;border-bottom:3px solid #fff;margin:0 0 20px 0;">
      <h1 style="font-size:24px;font-weight:bold;color:white;">metric.io</h1>
    </div>
    <div style="background:#fff;border:1px solid #ddd;padding:10px 20px;margin:0 30px;">

      <h1>
        We've received an alert for <%= site %>
      </h1>

      <style>
        tr{
          padding: 10px;
        }

        tr td:first-child{
          width: 80px;
          font-weight: bold;
        }

        tr td{
          width: 200px;
          padding: 6px;
        }
      </style>
      <div style="">
        <table>
          <tr style="padding: 10px">
            <td style="width: 100px">metric</td>
            <td><%= payload["metric"] %></td>
          </tr>
          <% if payload["meta"] %>
            <tr>
              <td>meta</td>
              <td><%= payload["meta"] %></td>
            </tr>
          <% end %>
          <% if payload["amount"] %>
            <tr>
              <td>amount</td>
              <td><%= payload["amount"] %></td>
            </tr>
          <% end %>
          <tr>
            <td>time</td>
            <td><%= payload["time"] %></td>
          </tr>
        </table>
      </div>

      <div style="color:#444;font-size:12px;line-height:130%;border-top:1px solid #ddd;margin-top:35px;">
        <p>
          info@metric.io - https://metric.io
        </p>
      </div>
    </div>
  </body>
</html>
    EOF
  end
end
