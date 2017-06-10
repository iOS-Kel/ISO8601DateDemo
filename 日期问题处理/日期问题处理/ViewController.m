//
//  ViewController.m
//  日期问题处理
//
//  Created by GFK on 2017/6/7.
//  Copyright © 2017年 citotem. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    /** 获取本地时间 注意：获取本地时间，返回的就不应该是NSDate对象，因为NSDate对象一定是0时区的。
     而且我们想使用时间时，也应该是使用时间的字符串。笔者刚学习时就返回NSDate
     */
//    NSLog(@"本地当前时间 = %@", [self getCurrentDate]);
    
    
    /** 时间字符串转日期对象 测试通过*/
//    NSLog(@"date object = %@", [self getDateFromDateString:@"2017-06-07  12:27:30 +0" withFormatter:@"yyyy-MM-dd HH:mm:ss Z"]);
    

    /*
    // NSDate 转ISO8601
    NSDate *GMTDate = [NSDate date];
    
    // NSISO8601DateFormatter无法自定义格式，格式已被苹果设定好了。其格式为：yyyy-MM-dd'T'HH:mm:ssZZZZZ (有5个Z是因为时区有5个字符，例如 00:00)
    NSISO8601DateFormatter *ISO8601DateFormatter = [[NSISO8601DateFormatter alloc] init];
    
    NSString *ISO8601DateString = [ISO8601DateFormatter stringFromDate:GMTDate];
    
    NSLog(@"ISO8601DateString = %@", ISO8601DateString);// 可以发现ISO8601日期格式是没有空格的2017-06-10T08:01:58Z
     */
    
    
    /*
    NSISO8601DateFormatter *ISO8601DateFormatter = [[NSISO8601DateFormatter alloc] init];
    
    NSLog(@"%@", [NSTimeZone knownTimeZoneNames]);// 获取时区名称
    
    // ISO8601DateFormatter.timeZone设置对NSDate转NSString时有效，转NSString时会自动+8小时（假设在中国）。
    // ISO8601时间字符串在转成NSDate类型时，api内部自动转成+0市区的时间
//    ISO8601DateFormatter.timeZone = [NSTimeZone timeZoneWithName:@"America/Chicago"];// 打印结果是 2017-06-08T21:00:00-05:00 注意：美国芝加哥在西5区，比中国慢13小时
    
    // ISO8601DateFormatter.timeZone默认是0时区的。 注意：日期字符串转NSDate时，不关timeZone的事
//    ISO8601DateFormatter.timeZone = [NSTimeZone systemTimeZone];// 2017-06-09T10:00:00+08:00 注意：systemTimeZone获取的是当前系统所在地方的时区
    
    // Colon:冒号  Dash:破折号
//    该ISO8601DateFormatter.formatOptions可处理毫秒问题，但是引起了时区无效问题，无论字符串时区是多少，转date时时间都一个样，显然不正确
    ISO8601DateFormatter.formatOptions = NSISO8601DateFormatWithFullDate | NSISO8601DateFormatWithTime | NSISO8601DateFormatWithDashSeparatorInDate | NSISO8601DateFormatWithColonSeparatorInTime | NSISO8601DateFormatWithColonSeparatorInTimeZone;
    
//    系统默认的。可处理时区问题，但是一旦出现毫秒，时间字符串转date就会失败，date会等于nil
//    ISO8601DateFormatter.formatOptions = NSISO8601DateFormatWithInternetDateTime | NSISO8601DateFormatWithDashSeparatorInDate | NSISO8601DateFormatWithColonSeparatorInTime | NSISO8601DateFormatWithColonSeparatorInTimeZone;
    
    NSDate *date = [ISO8601DateFormatter dateFromString:@"2017-06-08T12:00:00.778+08:00"];
    
//    NSString *ISO8601DateString = [ISO8601DateFormatter stringFromDate:date];
//    
//    ISO8601DateFormatter.formatOptions = NSISO8601DateFormatWithInternetDateTime | NSISO8601DateFormatWithDashSeparatorInDate | NSISO8601DateFormatWithColonSeparatorInTime | NSISO8601DateFormatWithColonSeparatorInTimeZone;
//    
//    date = [ISO8601DateFormatter dateFromString:ISO8601DateString];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    
    dateFormatter.timeZone = [NSTimeZone systemTimeZone];
    
    dateFormatter.dateFormat = @"yyy-MM-dd HH:mm:ss Z";
    
    NSString *dateString = [dateFormatter stringFromDate:date];
    
    NSLog(@"dateString = %@", dateString);
     
     // 总结：无法通过NSISO8601DateFormatter类处理带毫秒的ISO8601时间字符串
    */
    
    //--------------------以下内容已做笔记------------------------------------
    
    /*
    // date转string 用到NSTimeZone--未做笔记
    NSISO8601DateFormatter *ISO8601DateFormatter = [[NSISO8601DateFormatter alloc] init];
    
    ISO8601DateFormatter.timeZone = [NSTimeZone systemTimeZone];
    
    NSString *ISO8601DateString = [ISO8601DateFormatter stringFromDate:[NSDate date]];
    NSLog(@"ISO8601DateString = %@", ISO8601DateString);// 2017-06-09T12:22:01+08:00
    */
    
    /*
     // string转date 用到NSTimeZone--未做笔记
     NSISO8601DateFormatter *ISO8601DateFormatter = [[NSISO8601DateFormatter alloc] init];
    
    //ISO8601DateFormatter.timeZone = [NSTimeZone systemTimeZone];// 无论怎么设置，转成NSDate对象时，都是0时区的时间
    
     NSDate *ISO8601Date = [ISO8601DateFormatter dateFromString:@"2017-06-09T12:00:00+08:00"];
     NSLog(@"ISO8601Date = %@", ISO8601Date);
    */
    
    
    /*
    // date转string再转回date 验证转换没问题--确定没问题 用到NSTimeZone--未做笔记
    NSISO8601DateFormatter *ISO8601DateFormatter = [[NSISO8601DateFormatter alloc] init];
    
    // 如果不设置时区，那么下面的ISO8601Date会少8个小时---其实时间没少，之前没发现时区改变了。其实设不设置都无所谓的。
    ISO8601DateFormatter.timeZone = [NSTimeZone systemTimeZone];
    
    NSDate *GTMDate = [NSDate date];// 当前0时区时间
    NSLog(@"GTMDate = %@", GTMDate);
    
    // 1.date转string
    NSString *ISO8601DateString = [ISO8601DateFormatter stringFromDate:GTMDate];//有设置timeZone,就是当前时区的时间，不设置就是0时区时间。实际上两个时间是同一个时间，设不设置没关系，只不过设置之后时间看起来只管，一看就知道本时区时间是多少。
    NSLog(@"ISO8601DateString = %@", ISO8601DateString);
    
    // 2.string转date 转date一定是0时区的时间，没得改，苹果给定死了。
    NSDate *ISO8601Date = [ISO8601DateFormatter dateFromString:ISO8601DateString];
    NSLog(@"ISO8601Date = %@", ISO8601Date);
    */
    
    
    /*
    // string转date再转回string 验证转换没问题--确定没问题 用到NSTimeZone--未做笔记
    NSISO8601DateFormatter *ISO8601DateFormatter = [[NSISO8601DateFormatter alloc] init];
    
    ISO8601DateFormatter.timeZone = [NSTimeZone systemTimeZone];
    
    NSString *ISO8601DateString = @"2017-06-09T12:00:00+08:00";
    NSLog(@"ISO8601DateString = %@", ISO8601DateString);
    
    NSDate *date = [ISO8601DateFormatter dateFromString:ISO8601DateString];
    NSLog(@"date = %@", date);
    
    // 设置转成字符串的格式,默认是ISO8601格式的日期字符串，就是酱样子的：2017-06-09T12:00:00+08:00\
    设置之后是酱紫的：2017-06-09 12:00:00+08:00
    ISO8601DateFormatter.formatOptions = NSISO8601DateFormatWithFullDate | NSISO8601DateFormatWithFullTime | NSISO8601DateFormatWithSpaceBetweenDateAndTime;
    
    ISO8601DateString = [ISO8601DateFormatter stringFromDate:date];
    NSLog(@"ISO8601DateString = %@", ISO8601DateString);
     
     // 总结：转成NSDate时，时间一定会被转成0时区时间
    */
    
    
    /*
    // 从ISO8602日期字符串中获取时间部分
    NSISO8601DateFormatter *ISO8601DateFormatter = [[NSISO8601DateFormatter alloc] init];
    
    ISO8601DateFormatter.timeZone = [NSTimeZone systemTimeZone];
    
    NSDate *GMTDate = [NSDate date];

//    *fullDate 年月日
//    *fullTime 时分秒
//    *dashSeparator 破折号充当分隔线
//    *InternetDateTime 互联网日期时间 2016-06-13T16:00:00+00:00
//    *SpaceBetweenDateAndTime 日期和时间中间空格隔开 20160613 160000
    
    ISO8601DateFormatter.formatOptions = NSISO8601DateFormatWithFullDate | NSISO8601DateFormatWithDashSeparatorInDate;
    NSString *localTime =  [ISO8601DateFormatter stringFromDate:GMTDate];
    NSLog(@"localTime1 = %@", localTime);
    
    ISO8601DateFormatter.formatOptions = NSISO8601DateFormatWithInternetDateTime;
    localTime =  [ISO8601DateFormatter stringFromDate:GMTDate];
    NSLog(@"localTime2 = %@", localTime);
    
    ISO8601DateFormatter.formatOptions = NSISO8601DateFormatWithFullDate | NSISO8601DateFormatWithFullTime | NSISO8601DateFormatWithSpaceBetweenDateAndTime;
    localTime =  [ISO8601DateFormatter stringFromDate:GMTDate];
    NSLog(@"localTime3 = %@", localTime);
    
    ISO8601DateFormatter.formatOptions = NSISO8601DateFormatWithFullDate;
    localTime =  [ISO8601DateFormatter stringFromDate:GMTDate];
    NSLog(@"localTime4 = %@", localTime);
    
    ISO8601DateFormatter.formatOptions = NSISO8601DateFormatWithYear | NSISO8601DateFormatWithWeekOfYear | NSISO8601DateFormatWithDashSeparatorInDate;
    localTime =  [ISO8601DateFormatter stringFromDate:GMTDate];
    NSLog(@"localTime5 = %@", localTime);// Week of Year
    
    ISO8601DateFormatter.formatOptions = NSISO8601DateFormatWithYear | NSISO8601DateFormatWithWeekOfYear | NSISO8601DateFormatWithDay | NSISO8601DateFormatWithDashSeparatorInDate;
    localTime =  [ISO8601DateFormatter stringFromDate:GMTDate];
    NSLog(@"localTime6 = %@", localTime);// Week of Year with Ordinal Weekday
    
    ISO8601DateFormatter.formatOptions = NSISO8601DateFormatWithYear | NSISO8601DateFormatWithDay | NSISO8601DateFormatWithDashSeparatorInDate;// Ordinal Day of Year 序数日
    localTime =  [ISO8601DateFormatter stringFromDate:GMTDate];
    NSLog(@"localTime7 = %@", localTime);
    */
    
}




+ (NSDate *)dateFromISO8601String:(NSString *)string {
    if (!string) return nil;
    
    struct tm tm;
    time_t t;
    
    strptime([string cStringUsingEncoding:NSUTF8StringEncoding], "%Y-%m-%dT%H:%M:%S%z", &tm);
    tm.tm_isdst = -1;
    t = mktime(&tm);
    
//    return [NSDate dateWithTimeIntervalSince1970:t]; // 零时区
    return [NSDate dateWithTimeIntervalSince1970:t + [[NSTimeZone localTimeZone] secondsFromGMT]];//东八区
}


// 日期对象转成字符串
// 注意传入的日期格式必须是：@"yyyy-MM-dd HH:mm:ss"
- (NSString *)getDateString:(NSDate *)date {
    
    NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
    // 创建日历对象
    NSCalendar *calendar = [NSCalendar currentCalendar];// currentCalendar user's preferred calendar 既是gregorian
    
    // 给日期组件对象赋值
    NSInteger unitFlags = NSCalendarUnitYear |
    NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour |
    NSCalendarUnitMinute | NSCalendarUnitSecond;
    
    // 这里如果不这么做的话，那么时间会多出8个小时
    NSTimeInterval timeInterval = [date timeIntervalSince1970] - [NSTimeZone systemTimeZone].secondsFromGMT;
    NSDate *localDate = [NSDate dateWithTimeIntervalSince1970:timeInterval];
    dateComponents = [calendar components:unitFlags fromDate:localDate];
    
    return [NSString stringWithFormat:@"%04ld-%02ld-%02ld %02ld:%02ld:%02ld", dateComponents.year, dateComponents.month, dateComponents.day, dateComponents.hour, dateComponents.minute, dateComponents.second];
    
}


- (NSDate *)getDateFromDateString:(NSString *)dateString withFormatter:(NSString *)formatter {
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    
    dateFormatter.timeZone = [NSTimeZone systemTimeZone];
    
    dateFormatter.dateFormat = formatter;
    
    return [dateFormatter dateFromString:dateString];
}

// 获取本地当前时间
- (NSString *)getCurrentDate {
    
    NSDate *GMTDate = [NSDate date];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    
    formatter.timeZone = [NSTimeZone systemTimeZone];
    
    formatter.dateFormat = @"yyyy-MM-dd HH:mm:ssZ";// 日期、时间、时区之间的空格可有可无，取决于你
    
    return [formatter stringFromDate:GMTDate];
}


@end
