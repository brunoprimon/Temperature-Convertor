.class public Lcom/doignon/sylvain/temperatureconvertor/MainActivity;
.super Landroid/support/v7/app/AppCompatActivity;
.source "MainActivity.java"


# instance fields
.field public ignoreChanges:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 8
    invoke-direct {p0}, Landroid/support/v7/app/AppCompatActivity;-><init>()V

    .line 10
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/doignon/sylvain/temperatureconvertor/MainActivity;->ignoreChanges:Z

    return-void
.end method

.method private static cel2far(Ljava/lang/Double;)Ljava/lang/Double;
    .locals 4
    .param p0, "celsius"    # Ljava/lang/Double;

    .prologue
    .line 38
    invoke-virtual {p0}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v0

    const-wide v2, 0x3ffccccccccccccdL    # 1.8

    mul-double/2addr v0, v2

    const-wide/high16 v2, 0x4040000000000000L    # 32.0

    add-double/2addr v0, v2

    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v0

    return-object v0
.end method

.method private static far2cel(Ljava/lang/Double;)Ljava/lang/Double;
    .locals 4
    .param p0, "fahrenheit"    # Ljava/lang/Double;

    .prologue
    .line 42
    invoke-virtual {p0}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v0

    const-wide/high16 v2, 0x4040000000000000L    # 32.0

    sub-double/2addr v0, v2

    const-wide v2, 0x3fe1c71c71c71c72L    # 0.5555555555555556

    mul-double/2addr v0, v2

    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v0

    return-object v0
.end method

.method private static roundTwoDecimals(D)D
    .locals 6
    .param p0, "d"    # D

    .prologue
    .line 46
    new-instance v1, Landroid/icu/text/DecimalFormat;

    const-string v2, "#.##"

    invoke-direct {v1, v2}, Landroid/icu/text/DecimalFormat;-><init>(Ljava/lang/String;)V

    .line 47
    .local v1, "twoDForm":Landroid/icu/text/DecimalFormat;
    invoke-virtual {v1, p0, p1}, Landroid/icu/text/DecimalFormat;->format(D)Ljava/lang/String;

    move-result-object v2

    const-string v3, ","

    const-string v4, "."

    invoke-virtual {v2, v3, v4}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    .line 48
    .local v0, "ss":Ljava/lang/String;
    invoke-static {v0}, Ljava/lang/Double;->valueOf(Ljava/lang/String;)Ljava/lang/Double;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v2

    return-wide v2
.end method


# virtual methods
.method public handler(Ljava/lang/CharSequence;Landroid/widget/EditText;)V
    .locals 8
    .param p1, "s"    # Ljava/lang/CharSequence;
    .param p2, "targetField"    # Landroid/widget/EditText;

    .prologue
    .line 58
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result v5

    if-nez v5, :cond_0

    .line 59
    const-string v5, ""

    invoke-virtual {p0, v5, p2}, Lcom/doignon/sylvain/temperatureconvertor/MainActivity;->setText(Ljava/lang/String;Landroid/widget/EditText;)V

    .line 85
    :goto_0
    return-void

    .line 63
    :cond_0
    const/4 v4, 0x1

    .line 64
    .local v4, "wantRounded":Z
    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v5

    const-string v6, "."

    invoke-virtual {v5, v6}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 65
    const/4 v4, 0x0

    .line 67
    :cond_1
    :try_start_0
    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    move-result-wide v6

    invoke-static {v6, v7}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    .line 72
    .local v2, "number":Ljava/lang/Double;
    invoke-virtual {p2}, Landroid/widget/EditText;->getTag()Ljava/lang/Object;

    move-result-object v5

    const-string v6, "cel"

    if-ne v5, v6, :cond_2

    .line 73
    invoke-static {v2}, Lcom/doignon/sylvain/temperatureconvertor/MainActivity;->far2cel(Ljava/lang/Double;)Ljava/lang/Double;

    move-result-object v2

    .line 77
    :goto_1
    if-eqz v4, :cond_3

    .line 78
    invoke-virtual {v2}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v6

    invoke-static {v6, v7}, Ljava/lang/Math;->round(D)J

    move-result-wide v6

    long-to-int v1, v6

    .line 79
    .local v1, "n":I
    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v3

    .line 84
    .end local v1    # "n":I
    .local v3, "result":Ljava/lang/String;
    :goto_2
    invoke-virtual {p0, v3, p2}, Lcom/doignon/sylvain/temperatureconvertor/MainActivity;->setText(Ljava/lang/String;Landroid/widget/EditText;)V

    goto :goto_0

    .line 68
    .end local v2    # "number":Ljava/lang/Double;
    .end local v3    # "result":Ljava/lang/String;
    :catch_0
    move-exception v0

    .line 69
    .local v0, "e":Ljava/lang/Exception;
    const-string v5, ""

    invoke-virtual {p0, v5, p2}, Lcom/doignon/sylvain/temperatureconvertor/MainActivity;->setText(Ljava/lang/String;Landroid/widget/EditText;)V

    goto :goto_0

    .line 75
    .end local v0    # "e":Ljava/lang/Exception;
    .restart local v2    # "number":Ljava/lang/Double;
    :cond_2
    invoke-static {v2}, Lcom/doignon/sylvain/temperatureconvertor/MainActivity;->cel2far(Ljava/lang/Double;)Ljava/lang/Double;

    move-result-object v2

    goto :goto_1

    .line 81
    :cond_3
    invoke-virtual {v2}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v6

    invoke-static {v6, v7}, Lcom/doignon/sylvain/temperatureconvertor/MainActivity;->roundTwoDecimals(D)D

    move-result-wide v6

    invoke-static {v6, v7}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v2

    .line 82
    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    .restart local v3    # "result":Ljava/lang/String;
    goto :goto_2
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 3
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 16
    invoke-super {p0, p1}, Landroid/support/v7/app/AppCompatActivity;->onCreate(Landroid/os/Bundle;)V

    .line 17
    const v2, 0x7f04001a

    invoke-virtual {p0, v2}, Lcom/doignon/sylvain/temperatureconvertor/MainActivity;->setContentView(I)V

    .line 20
    const v2, 0x7f0b0056

    invoke-virtual {p0, v2}, Lcom/doignon/sylvain/temperatureconvertor/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    .line 21
    .local v0, "cel":Landroid/widget/EditText;
    const v2, 0x7f0b0058

    invoke-virtual {p0, v2}, Lcom/doignon/sylvain/temperatureconvertor/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/EditText;

    .line 24
    .local v1, "far":Landroid/widget/EditText;
    const-string v2, "cel"

    invoke-virtual {v0, v2}, Landroid/widget/EditText;->setTag(Ljava/lang/Object;)V

    .line 25
    const-string v2, "far"

    invoke-virtual {v1, v2}, Landroid/widget/EditText;->setTag(Ljava/lang/Object;)V

    .line 28
    new-instance v2, Lcom/doignon/sylvain/temperatureconvertor/MyTextWatcher;

    invoke-direct {v2, v1, p0}, Lcom/doignon/sylvain/temperatureconvertor/MyTextWatcher;-><init>(Landroid/widget/EditText;Lcom/doignon/sylvain/temperatureconvertor/MainActivity;)V

    invoke-virtual {v0, v2}, Landroid/widget/EditText;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 29
    new-instance v2, Lcom/doignon/sylvain/temperatureconvertor/MyTextWatcher;

    invoke-direct {v2, v0, p0}, Lcom/doignon/sylvain/temperatureconvertor/MyTextWatcher;-><init>(Landroid/widget/EditText;Lcom/doignon/sylvain/temperatureconvertor/MainActivity;)V

    invoke-virtual {v1, v2}, Landroid/widget/EditText;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 32
    new-instance v2, Lcom/doignon/sylvain/temperatureconvertor/MyFocusWatcher;

    invoke-direct {v2, v0}, Lcom/doignon/sylvain/temperatureconvertor/MyFocusWatcher;-><init>(Landroid/widget/EditText;)V

    invoke-virtual {v0, v2}, Landroid/widget/EditText;->setOnFocusChangeListener(Landroid/view/View$OnFocusChangeListener;)V

    .line 33
    new-instance v2, Lcom/doignon/sylvain/temperatureconvertor/MyFocusWatcher;

    invoke-direct {v2, v1}, Lcom/doignon/sylvain/temperatureconvertor/MyFocusWatcher;-><init>(Landroid/widget/EditText;)V

    invoke-virtual {v1, v2}, Landroid/widget/EditText;->setOnFocusChangeListener(Landroid/view/View$OnFocusChangeListener;)V

    .line 35
    return-void
.end method

.method public setText(Ljava/lang/String;Landroid/widget/EditText;)V
    .locals 1
    .param p1, "text"    # Ljava/lang/String;
    .param p2, "targetField"    # Landroid/widget/EditText;

    .prologue
    .line 52
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/doignon/sylvain/temperatureconvertor/MainActivity;->ignoreChanges:Z

    .line 53
    invoke-virtual {p2, p1}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 54
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/doignon/sylvain/temperatureconvertor/MainActivity;->ignoreChanges:Z

    .line 55
    return-void
.end method
