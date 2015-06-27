#import "TiUIView.h"
#import "JVFloatLabeledTextView.h"

@interface TsFloatlabelfieldTextViewView : TiUIView<UITextViewDelegate>
{
    JVFloatLabeledTextView *fltf;    
    NSNumber *debug;
}

-(void)setValue:(id)text;
-(id)getValue;

@end