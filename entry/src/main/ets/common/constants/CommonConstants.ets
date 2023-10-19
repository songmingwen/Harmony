import NewsTypeBean from '../bean/NewsTypeBean';

/**
 * Common constants for all features.
 */
export class CommonConstants {
  /**
   * The placeholder of search component. Currently, component interfaces do not support the Resource type.
   * Therefore, you need to define constants. The default prompt in the search box does not support
   * internationalization.
   */
  static readonly SEARCH_PLACEHOLDER = '搜索...';
  /**
   * The font family of search component.
   */
  static readonly SEARCH_FONT_FAMILY = 'serif';
  /**
   * Search weight.
   */
  static readonly SEARCH_WEIGHT: number = 10;
  /**
   * Detail page url.
   */
  static readonly DETAIL_PAGE = 'pages/DetailPage';
  /**
   * Swiper page url.
   */
  static readonly SWIPER_PAGE = 'pages/SwiperPage';
  /**
   * Dialog page url.
   */
  static readonly DIALOG_PAGE = 'pages/DialogPage';
  /**
   * Anim page url.
   */
  static readonly ANIM_PAGE = 'pages/AnimPage';
  /**
   * News page url.
   */
  static readonly NEWS_PAGE = 'pages/NewsPage';
  /**
   * News page url.
   */
  static readonly NOTIFICATION_PAGE = 'pages/NotificationPage';
  /**
   * Lottie page url.
   */
  static readonly LOTTIE_PAGE = 'pages/LottiePage';
  /**
   * This is key param of data.
   */
  static readonly KEY_PARAM_DATA = 'data';
  /**
   * Scroll weight.
   */
  static readonly SCROLL_WEIGHT: number = 1;
  /**
   * The initial value of category size which is increased by one.
   */
  static readonly CATEGORY_INCREMENTAL_STEP: number = 1;
  /**
   * Category content list size.
   */
  static readonly CATEGORY_CONTENT_LIST_SIZE: number = 6;
  /**
   * Detail page list size.
   */
  static readonly DETAIL_PAGE_LIST_SIZE: number = 2;
  /**
   * The break point value.
   */
  static readonly BREAK_POINTS_VALUE: Array<string> = ['320vp', '600vp', '840vp'];
  /**
   * The columns of grid for SM device.
   */
  static readonly COLUMNS_SM: number = 4;
  /**
   * The columns of grid for MD device.
   */
  static readonly COLUMNS_MD: number = 8;
  /**
   * The columns of grid for LG device.
   */
  static readonly COLUMNS_LG: number = 12;
  /**
   * The gutter of grid for all device.
   */
  static readonly GUTTER_X: number = vp2px(20);
  /**
   * The span of grid for SM device.
   */
  static readonly SPAN_SM: number = 4;
  /**
   * The span of grid for MD device.
   */
  static readonly SPAN_MD: number = 6;
  /**
   * The span of grid for LG device.
   */
  static readonly SPAN_LG: number = 8;
  /**
   * The offset of grid for MD device.
   */
  static readonly OFFSET_MD: number = 1;
  /**
   * The offset of grid for LG device.
   */
  static readonly OFFSET_LG: number = 2;
  /**
   * Row width.
   */
  static readonly ROW_WIDTH_PERCENT = '100%';
  /**
   * The full width.
   */
  static readonly FULL_WIDTH_PERCENT = '100%';

  /**
   * The full height.
   */
  static readonly FULL_HEIGHT_PERCENT = '100%';

  /**
   * Detail column height.
   */
  static readonly DETAIL_COLUMN_HEIGHT_PERCENT = '100%';
  /**
   * refresh header item width
   */
  static readonly REFRESH_HEADER_ITEM_DEFAULT_WIDTH = 30;
  /**
   * refresh header item animation duration
   */
  static readonly REFRESH_HEADER_ITEM_ANIM_DURATION = 1000;
  /**
   * refresh header item animation temp
   */
  static readonly REFRESH_HEADER_ITEM_ANIM_TEMPO = 2.0;
  /**
   * refresh header item animation ITERATIONS
   */
  static readonly REFRESH_HEADER_ITEM_ANIM_ITERATIONS = -1;
  /**
   * refresh header item scale width
   */
  static readonly REFRESH_HEADER_ITEM_SCALE_WIDTH = 80;
  /**
   * refresh header item width
   */
  static readonly FILE_MANAGER_Z_INDEX = 1;
  /**
   * index default select
   */
  static readonly INDEX_DEFAULT_SELECT = 1;
  /**
   * refresh default time out
   */
  static readonly REFRESH_DEFAULT_TIMEOUT = 6000;


  /**
   * The host address of the server.
   */
  static readonly SERVER: string = 'http://172.31.28.14:9588';

  /**
   * Get the news type.
   */
  static readonly GET_NEWS_TYPE: string = 'news/getNewsType';

  /**
   * Get the news list.
   */
  static readonly GET_NEWS_LIST: string = 'news/getNewsList';

  /**
   * The request success status code.
   */
  static readonly SERVER_CODE_SUCCESS: string = 'success';

  /**
   * The off set coefficient.
   */
  static readonly Y_OFF_SET_COEFFICIENT: number = 0.1;

  /**
   * The page size.
   */
  static readonly PAGE_SIZE: number = 4;

  /**
   * The refresh and load height.
   */
  static readonly CUSTOM_LAYOUT_HEIGHT: number = 70;

  /**
   * Http request success status code.
   */
  static readonly HTTP_CODE_200: number = 200;

  /**
   * The animation delay time.
   */
  static readonly DELAY_ANIMATION_DURATION: number = 300;

  /**
   * The delay time.
   */
  static readonly DELAY_TIME: number = 1000;

  /**
   * The animation duration.
   */
  static readonly ANIMATION_DURATION: number = 2000;

  /**
   * The http timeout duration.
   */
  static readonly HTTP_READ_TIMEOUT: number = 10000;

  /**
   * Full the width.
   */
  static readonly FULL_WIDTH: string = '100%';

  /**
   * Full the height.
   */
  static readonly FULL_HEIGHT: string = '100%';

  /**
   * The TabBars constants.
   */
  static readonly TabBars_UN_SELECT_TEXT_FONT_SIZE: number = 18;
  static readonly TabBars_SELECT_TEXT_FONT_SIZE: number = 24;
  static readonly TabBars_UN_SELECT_TEXT_FONT_WEIGHT: number = 400;
  static readonly TabBars_SELECT_TEXT_FONT_WEIGHT: number = 700;
  static readonly TabBars_BAR_HEIGHT: string = '7.2%';
  static readonly TabBars_HORIZONTAL_PADDING: string  = '2.2%';
  static readonly TabBars_BAR_WIDTH: string = '100%';
  static readonly TabBars_DEFAULT_NEWS_TYPES: Array<NewsTypeBean> = [
    { id: 0, name: '全部' },
    { id: 1, name: '国内' },
    { id: 2, name: '国际' },
    { id: 3, name: '娱乐' },
    { id: 4, name: '军事' },
    { id: 5, name: '体育' },
    { id: 6, name: '科技' },
    { id: 7, name: '财经' }
  ];

  /**
   * The NewsListConstant constants.
   */
  static readonly NewsListConstant_LIST_DIVIDER_STROKE_WIDTH: number = 0.5;
  static readonly NewsListConstant_GET_TAB_DATA_TYPE_ONE: number = 1;
  static readonly NewsListConstant_ITEM_BORDER_RADIUS: number = 16;
  static readonly NewsListConstant_NONE_IMAGE_SIZE: number = 120;
  static readonly NewsListConstant_NONE_TEXT_opacity: number = 0.6;
  static readonly NewsListConstant_NONE_TEXT_size: number = 16;
  static readonly NewsListConstant_NONE_TEXT_margin: number = 12;
  static readonly NewsListConstant_ITEM_MARGIN_TOP: string = '1.5%';
  static readonly NewsListConstant_LIST_MARGIN_LEFT: string = '3.3%';
  static readonly NewsListConstant_LIST_MARGIN_RIGHT: string = '3.3%';
  static readonly NewsListConstant_ITEM_HEIGHT: string = '32%';
  static readonly NewsListConstant_LIST_WIDTH: string =  '93.3%';

  /**
   * The NewsTitle constants.
   */
  static readonly NewsTitle_TEXT_MAX_LINES: number = 3;
  static readonly NewsTitle_TEXT_FONT_SIZE: number = 20;
  static readonly NewsTitle_TEXT_FONT_WEIGHT: number = 500;
  static readonly NewsTitle_TEXT_MARGIN_LEFT: string = '2.4%';
  static readonly NewsTitle_TEXT_MARGIN_TOP: string = '7.2%';
  static readonly NewsTitle_TEXT_HEIGHT: string = '9.6%';
  static readonly NewsTitle_TEXT_WIDTH: string = '78.6%';
  static readonly NewsTitle_IMAGE_MARGIN_LEFT: string = '3.5%';
  static readonly NewsTitle_IMAGE_MARGIN_TOP: string = '7.9%';
  static readonly NewsTitle_IMAGE_HEIGHT: string = '8.9%';
  static readonly NewsTitle_IMAGE_WIDTH: string = '11.9%';

  /**
   * The NewsContent constants.
   */
  static readonly NewsContent_WIDTH: string = '93%';
  static readonly NewsContent_HEIGHT: string = '16.8%';
  static readonly NewsContent_MARGIN_LEFT: string = '3.5%';
  static readonly NewsContent_MARGIN_TOP: string = '3.4%';
  static readonly NewsContent_MAX_LINES: number = 2;
  static readonly NewsContent_FONT_SIZE: number = 15;

  /**
   * The NewsSource constants.
   */
  static readonly NewsSource_MAX_LINES: number = 1;
  static readonly NewsSource_FONT_SIZE: number = 12;
  static readonly NewsSource_MARGIN_LEFT: string = '3.5%';
  static readonly NewsSource_MARGIN_TOP: string = '3.4%';
  static readonly NewsSource_HEIGHT: string = '7.2%';
  static readonly NewsSource_WIDTH: string = '93%';

  /**
   * The NewsGrid constants.
   */
  static readonly NewsGrid_MARGIN_LEFT: string = '3.5%';
  static readonly NewsGrid_MARGIN_RIGHT: string = '3.5%';
  static readonly NewsGrid_MARGIN_TOP: string = '5.1%';
  static readonly NewsGrid_WIDTH: string = '93%';
  static readonly NewsGrid_HEIGHT: string = '31.5%';
  static readonly NewsGrid_ASPECT_RATIO: number = 4;
  static readonly NewsGrid_COLUMNS_GAP: number = 5;
  static readonly NewsGrid_ROWS_TEMPLATE: string = '1fr';
  static readonly NewsGrid_IMAGE_BORDER_RADIUS: number = 8;

  /**
   * The RefreshLayout constants.
   */
  static readonly RefreshLayout_MARGIN_LEFT: string = '40%';
  static readonly RefreshLayout_TEXT_MARGIN_BOTTOM: number = 1;
  static readonly RefreshLayout_TEXT_MARGIN_LEFT: number = 7;
  static readonly RefreshLayout_TEXT_FONT_SIZE: number = 17;
  static readonly RefreshLayout_IMAGE_WIDTH: number = 18;
  static readonly RefreshLayout_IMAGE_HEIGHT: number = 18;

  /**
   * The NoMoreLayout constants.
   */
  static readonly NoMoreLayoutConstant_NORMAL_PADDING: number = 8;
  static readonly NoMoreLayoutConstant_TITLE_FONT: string = '16fp';

  /**
   * The RefreshConstant constants.
   */
  static readonly RefreshConstant_DELAY_PULL_DOWN_REFRESH: number = 50;
  static readonly RefreshConstant_CLOSE_PULL_DOWN_REFRESH_TIME: number = 150;
  static readonly RefreshConstant_DELAY_SHRINK_ANIMATION_TIME: number = 500;

  /**
   * The width or height is full.
   */
  static readonly FULL_LENGTH: string = '100%';

  /**
   * The width of title.
   */
  static readonly TITLE_WIDTH: string = '86.7%';

  /**
   * The width of download card.
   */
  static readonly CARD_WIDTH: string = '93.3%';

  /**
   * The weight of image.
   */
  static readonly IMAGE_WEIGHT: number = 1;

  /**
   * The weight of card content.
   */
  static readonly CARD_CONTENT_WEIGHT: number = 5;

  /**
   * The width of download content.
   */
  static readonly CARD_CONTENT_WIDTH: string = '70%';

  /**
   * The width of download image.
   */
  static readonly CARD_IMAGE_WIDTH: string = '30%';

  /**
   * The name of download file.
   */
  static readonly DOWNLOAD_FILE: string = '1653067.mp4';

  /**
   * The size of download file.
   */
  static readonly FILE_SIZE: string = '25.01MB';

  /**
   * Font weight of Large.
   */
  static readonly FONT_WEIGHT_LAGER: number = 500;

  /**
   * Font opacity.
   */
  static readonly FONT_OPACITY: number = 0.6;

  /**
   * Progress total.
   */
  static readonly PROGRESS_TOTAL: number = 100;

  /**
   * Progress Update speed.
   */
  static readonly PROGRESS_SPEED: number = 10;

  /**
   * Progress Update frequency.
   */
  static readonly UPDATE_FREQUENCY: number = 1000;

  /**
   * Notification id.
   */
  static readonly NOTIFICATION_ID: number = 1000;
}

/**
 * The refresh state enum.
 */
export const enum RefreshState {
  DropDown = 0,
  Release = 1,
  Refreshing = 2,
  Success = 3,
  Fail = 4
}

/**
 * The newsList state enum.
 */
export const enum PageState {
  Loading = 0,
  Success = 1,
  Fail = 2
}

/**
 * The request content type enum.
 */
export const enum ContentType {
  JSON = 'application/json'
}

/**
 * Download status.
 */
export enum DOWNLOAD_STATUS {
  INITIAL,
  DOWNLOADING,
  PAUSE,
  FINISHED
}