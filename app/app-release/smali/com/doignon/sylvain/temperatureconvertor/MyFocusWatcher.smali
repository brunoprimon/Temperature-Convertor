.class public Lcom/doignon/sylvain/temperatureconvertor/MyFocusWatcher;
.super Ljava/lang/Object;
.source "MyFocusWatcher.java"

# interfaces
.implements Landroid/view/View$OnFocusChangeListener;


# instance fields
.field private field:Landroid/widget/EditText;


# direct methods
.method public constructor <init>(Landroid/widget/EditText;)V
    .locals 0
    .param p1, "mfield"    # Landroid/widget/EditText;

    .prologue
    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 11
    iput-object p1, p0, Lcom/doignon/sylvain/temperatureconvertor/MyFocusWatcher;->field:Landroid/widget/EditText;

    .line 12
    return-void
.end method


# virtual methods
.method public onFocusChange(Landroid/view/View;Z)V
    .locals 2
    .param p1, "v"    # Landroid/view/View;
    .param p2, "hasFocus"    # Z

    .prologue
    .line 16
    if-eqz p2, :cond_0

    .line 17
    iget-object v0, p0, Lcom/doignon/sylvain/temperatureconvertor/MyFocusWatcher;->field:Landroid/widget/EditText;

    const-string v1, ""

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 19
    :cond_0
    return-void
.end method
