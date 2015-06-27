
#import "TsFloatlabelfieldTextViewViewProxy.h"
#import "TsFloatlabelfieldTextViewView.h"
@implementation TsFloatlabelfieldTextViewViewProxy

-(void)viewDidAttach
{
    ENSURE_UI_THREAD_0_ARGS;
    TsFloatlabelfieldTextViewView * view = (TsFloatlabelfieldTextViewView *)[self view];
}


-(void)setValue:(id)text
{
    ENSURE_STRING(text);
    [(TsFloatlabelfieldTextViewView*)[self view] performSelectorOnMainThread:@selector(setValue:)
                                                          withObject:text waitUntilDone:NO];
}
-(NSString *)value
{
    return [(TsFloatlabelfieldTextViewView*)[self view] getValue];
}

@end