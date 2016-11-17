.class public Lcom/doignon/sylvain/temperatureconvertor/MyTextWatcher;
.super Ljava/lang/Object;
.source "MyTextWatcher.java"

# interfaces
.implements Landroid/text/TextWatcher;


# instance fields
.field private mainActivity:Lcom/doignon/sylvain/temperatureconvertor/MainActivity;

.field private targetField:Landroid/widget/EditText;


# direct methods
.method public constructor <init>(Landroid/widget/EditText;Lcom/doignon/sylvain/temperatureconvertor/MainActivity;)V
    .locals 0
    .param p1, "target"    # Landroid/widget/EditText;
    .param p2, "mself"    # Lcom/doignon/sylvain/temperatureconvertor/MainActivity;

    .prologue
    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 13
    iput-object p1, p0, Lcom/doignon/sylvain/temperatureconvertor/MyTextWatcher;->targetField:Landroid/widget/EditText;

    .line 14
    iput-object p2, p0, Lcom/doignon/sylvain/temperatureconvertor/MyTextWatcher;->mainActivity:Lcom/doignon/sylvain/temperatureconvertor/MainActivity;

    .line 15
    return-void
.end method


# virtual methods
.method public afterTextChanged(Landroid/text/Editable;)V
    .locals 0
    .param p1, "s"    # Landroid/text/Editable;

    .prologue
    .line 20
    return-void
.end method

.method public beforeTextChanged(Ljava/lang/CharSequence;III)V
    .locals 0
    .param p1, "s"    # Ljava/lang/CharSequence;
    .param p2, "start"    # I
    .param p3, "count"    # I
    .param p4, "after"    # I

    .prologue
    .line 24
    return-void
.end method

.method public onTextChanged(Ljava/lang/CharSequence;III)V
    .locals 2
    .param p1, "s"    # Ljava/lang/CharSequence;
    .param p2, "start"    # I
    .param p3, "before"    # I
    .param p4, "count"    # I

    .prologue
    .line 29
    iget-object v0, p0, Lcom/doignon/sylvain/temperatureconvertor/MyTextWatcher;->mainActivity:Lcom/doignon/sylvain/temperatureconvertor/MainActivity;

    iget-boolean v0, v0, Lcom/doignon/sylvain/temperatureconvertor/MainActivity;->ignoreChanges:Z

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/doignon/sylvain/temperatureconvertor/MyTextWatcher;->mainActivity:Lcom/doignon/sylvain/temperatureconvertor/MainActivity;

    iget-object v1, p0, Lcom/doignon/sylvain/temperatureconvertor/MyTextWatcher;->targetField:Landroid/widget/EditText;

    invoke-virtual {v0, p1, v1}, Lcom/doignon/sylvain/temperatureconvertor/MainActivity;->handler(Ljava/lang/CharSequence;Landroid/widget/EditText;)V

    .line 30
    :cond_0
    return-void
.end method
