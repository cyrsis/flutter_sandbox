import 'dart:ui';

const String URL_LATEST_BASE = "https://api.exchangeratesapi.io/latest?base=";

// String constants
const String SKIP_INTRO = "SKIP_INTRO";
const String SAVED_VALUE = "SAVED_VALUE";
const String SAVED_CURRENCY = "SAVED_CURRENCY";
const String EXCHANGE_RATES = "EXCHANGE_RATES_";
const String DEFAULT_BASE = "EUR";

// CUSTOM APP COLORS
const Color ColorPrimary = const Color(0xFF6391FF);
const Color ColorSecondary = const Color(0xFF4D72CA);
const Color ColorGreen = const Color(0xFF35DE81);

// DIMENSIONS
const double ITEM_EXTENT = 200.0;

const Map<String, String> CountryNameMap = const {
  'AUD': 'Australia Dollar',
  'BGN': 'Bulgaria Lev',
  'BRL': 'Brazil Real',
  'CAD': 'Canada Dollar',
  'CHF': 'Switzerland Franc',
  'CNY': 'China Yuan Renminbi',
  'CZK': 'Czech Republic Koruna',
  'DKK': 'Denmark Krone',
  'EUR': 'Euro Member Countries',
  'GBP': 'United Kingdom Pound',
  'HKD': 'Hong Kong Dollar',
  'HRK': 'Croatia Kuna',
  'HUF': 'Hungary Forint',
  'IDR': 'Indonesia Rupiah',
  'ILS': 'Israel Shekel',
  'INR': 'India Rupee',
  'ISK': 'Iceland Krona',
  'JPY': 'Japan Yen',
  'KRW': 'South Korea Won',
  'MXN': 'Mexico Peso',
  'MYR': 'Malaysia Ringgit',
  'NOK': 'Norway Krone',
  'NZD': 'New Zealand Dollar',
  'PHP': 'Philippines Piso',
  'PLN': 'Poland Zloty',
  'RON': 'Romania Leu',
  'RUB': 'Russia Ruble',
  'SEK': 'Sweden Krona',
  'SGD': 'Singapore Dollar',
  'THB': 'Thailand Baht',
  'TRY': 'Turkey Lira',
  'USD': 'United States Dollar',
  'ZAR': 'South Africa Rand',
};
