
#import "TsFloatlabelfieldTextFieldViewProxy.h"
#import "TsFloatlabelfieldTextFieldView.h"
@implementation TsFloatlabelfieldTextFieldViewProxy

-(void)viewDidAttach
{
    ENSURE_UI_THREAD_0_ARGS;
    TsFloatlabelfieldTextFieldView * view = (TsFloatlabelfieldTextFieldView *)[self view];
}


-(void)setValue:(id)text
{
    ENSURE_STRING(text);
    [(TsFloatlabelfieldTextFieldView*)[self view] performSelectorOnMainThread:@selector(setValue:)
                                                          withObject:text waitUntilDone:NO];
}
-(NSString *)value
{
    return [(TsFloatlabelfieldTextFieldView*)[self view] getValue];
}

@end