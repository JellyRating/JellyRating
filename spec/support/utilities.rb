def valid_emails
    %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org first.last@foo.jp alice+bob@baz.cn]
end

def invalid_emails
    %w[user@example,com user_at_foo.org user.name@example.foo@bar_baz.com foo@bar+baz.com]
end