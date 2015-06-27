
#import "TsFloatlabelfieldTextViewView.h"
#import "TsFloatlabelfieldTextViewViewProxy.h"

@implementation TsFloatlabelfieldTextViewView

-(JVFloatLabeledTextView*)FLTF
{
    if (fltf==nil)
    {
        fltf = [[JVFloatLabeledTextView alloc] initWithFrame:CGRectZero];
        fltf.delegate = self;
        [self addSubview:fltf];
        [self bringSubviewToFront:fltf];
        fltf.translatesAutoresizingMaskIntoConstraints = NO;
    }
    return fltf;
}

-(void)frameSizeChanged:(CGRect)frame bounds:(CGRect)bounds
{
    if(debug) NSLog(@"[FLFV] frameSizeChanged frame %@ : %@ ", NSStringFromCGRect(frame), NSStringFromCGRect(fltf.frame));
    // If using Ti.UI.SIZE, frameSizeChanged is called with size (0,0). TODO
    [TiUtils setView:fltf positionRect: bounds];
    [super frameSizeChanged:frame bounds:bounds];
}

- (void)textViewDidChange:(UITextView *)textView
{
    [[self proxy] fireEvent:@"change" withObject:[NSDictionary dictionaryWithObject:[(UITextView *)fltf text] forKey:@"value"]];
}

- (void) dealloc
{
    fltf.delegate = nil;
    RELEASE_TO_NIL(fltf);
    [super dealloc];
}


#pragma mark Public API

-(void)setValue:(id)text
{
    if(debug) NSLog(@"[FLFV] setValue %@", text);
    [self FLTF].text = text;
}
-(id)getValue
{
    if(debug) NSLog(@"[FLFV] getValue");
    return [self FLTF].text;
}

-(void)setValue_:(id)text
{
    ENSURE_SINGLE_ARG(text, NSString);
    [self setValue:text];
}

-(void)setFontSize_:(id)size
{
    if(debug) NSLog(@"[FLFV] setFontSize_");
    [self FLTF].font = [UIFont systemFontOfSize:[TiUtils floatValue:size def:20]];
}

-(void)setTextColor_:(id)color
{
    ENSURE_SINGLE_ARG(color, NSString);
    if(debug) NSLog(@"[FLFV] setTextColor %@", color);
    
    [self FLTF].tintColor = [[TiUtils colorValue:color] _color];
    [self FLTF].textColor = [[TiUtils colorValue:color] _color];
}

-(void)setPlaceholderText_:(id)text
{
    ENSURE_SINGLE_ARG(text, NSString);
    if(debug) NSLog(@"[FLFV] setPlaceholderText");
    [self FLTF].placeholder = text;
}

-(void)setPlaceholderTextColor_:(id)color
{
    ENSURE_SINGLE_ARG(color, NSString);
    if(debug) NSLog(@"[FLFV] setPlaceholderTextColor %@", color);
    [self FLTF].placeholderTextColor = [[TiUtils colorValue:color] _color];
}

-(void)setFloatingLabelFontSize_:(id)size
{
    if(debug) NSLog(@"[FLFV] setFloatingLabelFontSize_");
    [self FLTF].floatingLabelFont = [UIFont boldSystemFontOfSize:[TiUtils floatValue:size def:10]];
}

-(void)setFloatingLabelTextColor_:(id)color
{
    if(debug) NSLog(@"[FLFV] setFloatingLabelTextColor_");
    ENSURE_SINGLE_ARG(color, NSString);
    // Use the TiUtils methods to get the values from the arguments
    [self FLTF].floatingLabelTextColor = [[TiUtils colorValue:color] _color];
    [self FLTF].floatingLabelActiveTextColor = [[TiUtils colorValue:color] _color];
}

-(void)setDebug_:(id)yesno
{
    debug = [TiUtils boolValue:yesno];
}

@end