//
//  MacroColor.h
//  Automall
//
//  Created by 刘思麟 on 2017/1/9.
//  Copyright © 2017年 SCW. All rights reserved.
//

#ifndef MacroColor_h
#define MacroColor_h

/**Color*/
#define HEXCOLOR(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#define PERSONAL_USERHEADERVIEW_BACKCOLOR HEXCOLOR(0x288ae5)
#define FONT_COLOR_TEXT_BLACK HEXCOLOR(0x333333)
#define FONT_COLOR_TEXT_RED HEXCOLOR(0xff5353)
#define FONT_COLOR_GRAY HEXCOLOR(0xf0f0f0)


#define COLOR_SPARELINE_GRAY HEXCOLOR(0xebebeb)
#define COLOR_BACK_GRAY HEXCOLOR(0xf0f0f0)
#endif /* MacroColor_h */
