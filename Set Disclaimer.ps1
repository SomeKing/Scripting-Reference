# Connect to Exchange Online
Write-Host "Connecting to Exchange Online" -ForegroundColor Cyan
Connect-ExchangeOnline

$HTMLDisclaimer = '<!-- Yellow caution banner -->
<table border=0 cellspacing=0 cellpadding=0 align="left" width="66%">
    <tr>
        <td style="background:#ffb900;padding:5pt 2pt 5pt 2pt"></td>
        <td width="100%" cellpadding="7px 6px 7px 15px" style="background:#fff8e5;padding:5pt 4pt 5pt 12pt;word-wrap:break-word">
            <div style="color:#222222;">
            <span style="color:#222; font-weight:bold;">CAUTION:</span>
                This email originated outside of the organization and contains suspicious content. DO NOT CLICK links or attachments unless you recongnize the sender and know the content is safe.
            </div>
        </td>
    </tr>
</table>'

$PhisingPatterns = "Password.*[expire|reset]
Password access
[reset|change|update].*password
Change.*password
\.odt
E-Notification
EMERGENCY
Retrieve*.document
Download*.document
confirm ownership for
word must be installed
prevent further unauthorized
prevent further unauthorised
informations has been
fallow our process
confirm your informations
failed to validate
unable to verify
delayed payment
activate your account
Update your payment
submit your payment
via Paypal
has been compromised
FRAUD NOTICE
your account will be closed
your apple id was used to sign in to
was blocked for violation
urged to download
that you validate your account
multiple login attempt
trying to access your account
suspend your account
restricted if you fail to update
informations on your account
update your account information
update in our security
Unusual sign-in activity
Account Was Limited
verify and reactivate
has.*been.*limited
have.*locked
has.*been.*suspended
unusual.*activity
notifications.*pending
your\ (customer\ )?account\ has
your\ (customer\ )?account\ was
new.*voice(\ )?mail
Periodic.*Maintenance
refund.*not.*approved
account.*(is\ )?on.*hold
wire.*transfer
secure.*update
secure.*document
temporar(il)?y.*deactivated
verification.*required
blocked\ your?\ online
suspicious\ activit
securely*.onedrive
securely*.dropbox
securely*.google drive
view message
gift card.*
giftcard.*
view attachment"



Write-Host "Creating Transport Rule" -ForegroundColor Cyan

# Create new Transport Rule
New-TransportRule -Name "External Email Warning" `
                  -FromScope NotInOrganization `
                  -SentToScope InOrganization `
                  -SubjectOrBodyMatchesPatterns $PhisingPatterns `
                  -ApplyHtmlDisclaimerLocation Prepend `
                  -ApplyHtmlDisclaimerText $HTMLDisclaimer `
                  -ApplyHtmlDisclaimerFallbackAction Wrap

Write-Host "Transport rule created" -ForegroundColor Green