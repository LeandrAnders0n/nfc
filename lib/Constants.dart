import 'dart:ui';

const Color DARK_THEME_BG_START = Color(0xff23272b);
const Color DARK_THEME_BG_END = Color(0xff111214);
const Color DARK_THEME_HEADING = Color(0xffe5e7e7);
const Color DARK_THEME_DARK = Color(0xffc7caca);
const Color DARK_THEME_LIGHT = Color(0xff79797a);

const Color LIGHT_THEME_BG_START = Color(0xffebf2fa);
const Color LIGHT_THEME_BG_END = Color(0xfff4f9fd);
const Color LIGHT_THEME_HEADING = Color(0xff1b2941);
const Color LIGHT_THEME_DARK = Color(0xff35425b);
const Color LIGHT_THEME_LIGHT = Color(0xff8b98b0);

const Color COLOR_BLUE = Color(0xff006ec1);
const Color COLOR_RED = Color(0xff921616);

const String GS_SOUND = "Sound";
const String GS_THEME = "Dark_Theme";
const String GS_EXPONENT = "Exponent";
const String GS_DECIMAL = "Decimal";

const String TYPE_PERCENTAGE = "Percentage";
const String TYPE_BMI = "BMI";
const String TYPE_BIRTHDAY = "Birthday";
const String TYPE_LENGTH = "Length";
const String TYPE_AREA = "Area";
const String TYPE_VOLUME = "Volume";
const String TYPE_TEMPERATURE = "Temperature";
const String TYPE_SPEED = "Speed";
const String TYPE_TIME = "Time";
const String TYPE_MASS = "Mass";
const String TYPE_BASE = "Base";
const String TYPE_QUANTITY = "Quantity";
const String TYPE_INVESTMENT = "Investment";
const String TYPE_LOAN = "Loan";
const String TYPE_TAX = "Tax";

// API
const String APP_NAME = "Calculator+";
const String PLAYSTORE_LINK = "https://play.google.com/store/apps/details?id=club.onepercent.calculator";
const String APPSTORE_LINK = "https://apps.apple.com/us/app/calculator-onepercent/id1540403294";
const String INVITE_MESSAGE = "Try out '$APP_NAME' brought to you by 'OnePercent' for FREE."
    "\n$APP_NAME is an advanced Calculator tool capable of computing advanced mathematic and scientific equations."
    "\nIt also provides a neat GUI for conversions between different units of measurement without having to remember formulae."
    "\n"
    "\nThe app is FREE with no hidden charges and is available for all platforms."
    "\n"
    "\nPlayStore: ${PLAYSTORE_LINK}"
    "\nAppStore: ${APPSTORE_LINK}"
    "\n"
    "\nWebsite: www.OnePercent.club";

String API = "https://www.onepercent.club/api/app-details/app/${APP_NAME.toLowerCase()}";
String PRIVACY_POLICY_LINK = "https://www.onepercent.club/documents/privacy-policy/${APP_NAME.toLowerCase()}";
String TERMS_CONDITIONS_LINK = "https://www.onepercent.club/documents/terms-conditions/${APP_NAME.toLowerCase()}";
const String WEBSITE_LINK = "https://www.onepercent.club";
const String APPSTORE_COMPANY_LINK = "https://apps.apple.com/us/developer/onepercent/id1536020418";
const String PLAYSTORE_COMPANY_LINK = "https://play.google.com/store/apps/dev?id=6945875796149230220";
const String LINKEDIN_LINK = "https://www.linkedin.com/company/onepercent-software";
const String FACEBOOK_LINK = "https://www.facebook.com/fb.onepercent.club";
const String INSTAGRAM_LINK = "https://www.instagram.com/_onepercent.Club";
const String TWITTER_LINK = "https://www.twitter.com/OnePercent_club";

// App Specific
const Map<String, String> LENGTH_MAP = {
  "km": "1",
  "pm": "1000000000000000",
  "nm": "1000000000000",
  "μm": "1000000000",
  "mm": "1000000",
  "cm": "100000",
  "dm": "10000",
  "m": "1000",
  "nmi": "0.539956803",
  "mi": "0.621371192",
  "yd": "1093.6133",
  "ft": "3280.8399",
  "in": "39370.0787",
  "ld": "0.00000260145005",
  "au": "0.00000000668458712",
  "ly": "0.000000000000105700083"
};

const Map<String, String> TIME_MAP = {
  "min": "1",
  "s": "60",
  "ms": "60000",
  "μs": "60000000",
  "ps": "60000000000000",
  "h": "1/60",
  "d": "1/1440",
  "wk": "0.0000992063492",
  "y": "0.00000190258752",
  "dec": "0.000000190258752",
  "cen": "0.0000000190258752"
};

const Map<String, String> MASS_MAP = {
  "g": "1",
  "kg": "0.001",
  "t": "0.000001",
  "mg": "1000",
  "μs": "1000000",
  "q": "0.00001",
  "lb": "0.00220462262",
  "oz": "0.0352739619",
  "ct": "5",
  "gr": "15.4323584",
};

const Map<String, String> SPEED_MAP = {
  "c": "0.000000000926566931",
  "m/s": "0.277777778",
  "km/h": "1",
  "km/s": "0.000277777778",
  "kn": "0.539956803",
  "mph": "0.621371192",
  "fps": "0.911344415",
  "ips": "10.936133",
};
const Map<String, String> QUANTITY_MAP = {
  "l": "1",
  "gal": "0.2641720524",
  "ml": "1000",
  "oz": "33.814022558919",
  "cup": "4.22675",
  "tablespoon": "67.628",
  "teaspoon": "202.884",
  "quart": "1.05669",
  "pint": "2.11338",
};

const Map<String, String> AREA_MAP = {
  "m\u00B2": "1",
  "km\u00B2": "0.000001",
  "ha": "0.0001",
  "dm\u00B2": "100",
  "cm\u00B2": "10000",
  "mm\u00B2": "1000000",
  "μm\u00B2": "1000000000000",
  "ac": "0.000247105407",
  "mile\u00B2": "0.000000386102159",
  "yd\u00B2": "1.19599005",
  "ft\u00B2": "10.7639104",
  "in\u00B2": "1550.0031",
  "rd\u00B2": "0.039536861",
};
const Map<String, String> VOLUME_MAP = {
  "m\u00B3": "1",
  "dm\u00B3": "1000",
  "cm\u00B3": "1000000",
  "mm\u00B3": "1000000000",
  "hl": "10",
  "l": "1000",
  "dl": "10000",
  "cl": "100000",
  "ml": "1000000",
  "ft\u00B3": "35.3146667",
  "in\u00B3": "61023.7441",
  "yd\u00B3": "1.30795062",
  "af\u00B3": "0.000810372771",
};
