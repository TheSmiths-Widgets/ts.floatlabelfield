#import "TiUIView.h"
#import "JVFloatLabeledTextField.h"
#import "JVFloatLabeledTextView.h"

@interface TsFloatlabelfieldView : TiUIView<UITextFieldDelegate>
{
    JVFloatLabeledTextField *fltf;
    NSString *placeholderText;
    float placeholderFontSize;
    float floatLabelFontSize;
    NSString *placeholderTextColor; // to be converted
    NSString *floatLabelTextColor; // to be converted
    
    NSNumber *debug;
}

-(void)updatePlaceholder;
-(void)setValue:(id)text;
-(id)getValue;

@end