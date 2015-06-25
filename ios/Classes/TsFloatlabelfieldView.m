
#import "TsFloatlabelfieldView.h"
#import "TsFloatlabelfieldViewProxy.h"

@implementation TsFloatlabelfieldView

-(JVFloatLabeledTextField*)FLTF
{
    if (fltf==nil)
    {
        fltf = [[JVFloatLabeledTextField alloc] initWithFrame:[self frame]];
        fltf.keepBaseline = 1;
        [self addSubview:fltf];
        [self bringSubviewToFront:fltf];
        WARN_IF_BACKGROUND_THREAD_OBJ;	//NSNotificationCenter is not threadsafe!
        NSNotificationCenter * theNC = [NSNotificationCenter defaultCenter];
        [theNC addObserver:self selector:@selector(textFieldDidChange:) name:UITextFieldTextDidChangeNotification object:fltf];
    }
    return fltf;
}

-(void)updatePlaceholder
{
    NSLog(@"updatePlaceholder: %@, %f", placeholderText, placeholderFontSize);
    NSString *_placeholderText = placeholderText.length>0 ? placeholderText : @"";
    UIColor *_placeholderColor = [[TiUtils colorValue:placeholderTextColor] _color];
    if(!_placeholderColor) {
        _placeholderColor = [UIColor darkGrayColor];
    }
    [self FLTF].attributedPlaceholder = [[NSAttributedString alloc] initWithString:_placeholderText
                                                                        attributes:@{NSForegroundColorAttributeName: _placeholderColor}];
    [self updateIntrinsicView];
}

-(void)updateIntrinsicView
{
    NSLog(@"updateIntrinsicView");
    CGSize size = [[self FLTF] intrinsicContentSize];
    [fltf setFrame:CGRectMake(fltf.frame.origin.x, fltf.frame.origin.y, size.width, size.height)];
    [fltf setBounds:CGRectMake(0, 0, size.width, size.height)];
    // Trigger frameSizeChanged
    [self setBounds:fltf.bounds];
}

-(void)frameSizeChanged:(CGRect)frame bounds:(CGRect)bounds
{
    NSLog(@"frameSizeChanged frame %@ : %@ ", NSStringFromCGRect(frame), NSStringFromCGRect(fltf.frame));
    // If using Ti.UI.SIZE, frameSizeChanged is called with size (0,0)
    if(bounds.size.height == 0 && bounds.size.width == 0) {
        return [self updateIntrinsicView];
    }
    [TiUtils setView:fltf positionRect:[TiUtils centerRect:[fltf frame] inRect:[self bounds]]];
    [super frameSizeChanged:frame bounds:bounds];
}

- (void)textFieldDidChange:(NSNotification *)notification
{
    [[self proxy] fireEvent:@"change" withObject:[NSDictionary dictionaryWithObject:[(UITextField *)fltf text] forKey:@"value"]];
}

- (void) dealloc
{
    fltf.delegate = nil;
    RELEASE_TO_NIL(fltf);
    WARN_IF_BACKGROUND_THREAD_OBJ;	//NSNotificationCenter is not threadsafe!
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UITextFieldTextDidChangeNotification object:nil];
    [super dealloc];
}


#pragma mark Public API

-(void)setValue:(id)text
{
    NSLog(@"[FLF] setValue %@", text);
    [self FLTF].text = text;
}
-(id)getValue
{
    NSLog(@"[FLF] getValue");
    return [self FLTF].text;
}

-(void)setValue_:(id)text
{
    ENSURE_SINGLE_ARG(text, NSString);
    [self setValue:text];
}

-(void)setFontSize_:(id)size
{
    NSLog(@"[FLF] setFontSize_");
    [self FLTF].font = [UIFont systemFontOfSize:[TiUtils floatValue:size def:20]];
}

-(void)setTextColor_:(id)color
{
    ENSURE_SINGLE_ARG(color, NSString);
    NSLog(@"[FLF] setTextColor %@", color);
    
    [self FLTF].tintColor = [[TiUtils colorValue:color] _color];
    [self FLTF].textColor = [[TiUtils colorValue:color] _color];
}

-(void)setPlaceholderText_:(id)text
{
    ENSURE_SINGLE_ARG(text, NSString);
    NSLog(@"[FLF] setPlaceholderText %@", text);
    
    placeholderText = text;
    [self updatePlaceholder];
}

-(void)setPlaceholderTextColor_:(id)color
{
    ENSURE_SINGLE_ARG(color, NSString);
    NSLog(@"[FLF] setPlaceholderTextColor %@", color);

    placeholderTextColor = color;
    [self updatePlaceholder];
}

-(void)setFloatingLabelFontSize_:(id)size
{
    NSLog(@"[FLF] setFloatingLabelFontSize_");
    [self FLTF].floatingLabelFont = [UIFont boldSystemFontOfSize:[TiUtils floatValue:size def:10]];
}

-(void)setFloatingLabelTextColor_:(id)color
{
    NSLog(@"[FLF] setFloatingLabelTextColor_");
    ENSURE_SINGLE_ARG(color, NSString);
    // Use the TiUtils methods to get the values from the arguments
    [self FLTF].floatingLabelTextColor = [[TiUtils colorValue:color] _color];
    [self FLTF].floatingLabelActiveTextColor = [[TiUtils colorValue:color] _color];
}

@end