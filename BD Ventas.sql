PGDMP         ;                {         
   bd ventas     15.2    15.2                0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    16567 
   bd ventas     DATABASE        CREATE DATABASE "bd ventas " WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Spain.1252';
    DROP DATABASE "bd ventas ";
                postgres    false            �            1259    24769    book    TABLE     n  CREATE TABLE public.book (
    "id " integer NOT NULL,
    title character(250) NOT NULL,
    "slug " character(250) NOT NULL,
    "description " "char" NOT NULL,
    "price " money NOT NULL,
    cover_path character(250) NOT NULL,
    file_path character(250) NOT NULL,
    create_at timestamp with time zone NOT NULL,
    update_at time with time zone NOT NULL
);
    DROP TABLE public.book;
       public         heap    postgres    false            �            1259    24788 
   sales_item    TABLE     �   CREATE TABLE public.sales_item (
    "id " integer NOT NULL,
    book_id integer NOT NULL,
    order_id integer NOT NULL,
    price money NOT NULL,
    dows_ava integer NOT NULL
);
    DROP TABLE public.sales_item;
       public         heap    postgres    false            �            1259    24777    sales_order    TABLE     �   CREATE TABLE public.sales_order (
    "id " integer NOT NULL,
    customer_id integer NOT NULL,
    "total " money NOT NULL,
    playment_status bigint NOT NULL,
    create_at timestamp with time zone NOT NULL
);
    DROP TABLE public.sales_order;
       public         heap    postgres    false            �            1259    24776    sales_order_playment_status_seq    SEQUENCE     �   CREATE SEQUENCE public.sales_order_playment_status_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE public.sales_order_playment_status_seq;
       public          postgres    false    218                       0    0    sales_order_playment_status_seq    SEQUENCE OWNED BY     c   ALTER SEQUENCE public.sales_order_playment_status_seq OWNED BY public.sales_order.playment_status;
          public          postgres    false    217            �            1259    24763    user     TABLE     w  CREATE TABLE public."user " (
    "id " integer NOT NULL,
    "firstname " character(45) NOT NULL,
    lastname character(45) NOT NULL,
    "fullname " character(100) NOT NULL,
    email character(45) NOT NULL,
    password character(250) NOT NULL,
    role bigint NOT NULL,
    create_at timestamp with time zone NOT NULL,
    update_at timestamp with time zone NOT NULL
);
    DROP TABLE public."user ";
       public         heap    postgres    false            �            1259    24762    user _role_seq    SEQUENCE     y   CREATE SEQUENCE public."user _role_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public."user _role_seq";
       public          postgres    false    215                       0    0    user _role_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public."user _role_seq" OWNED BY public."user ".role;
          public          postgres    false    214            s           2604    24780    sales_order playment_status    DEFAULT     �   ALTER TABLE ONLY public.sales_order ALTER COLUMN playment_status SET DEFAULT nextval('public.sales_order_playment_status_seq'::regclass);
 J   ALTER TABLE public.sales_order ALTER COLUMN playment_status DROP DEFAULT;
       public          postgres    false    218    217    218            r           2604    24766 
   user  role    DEFAULT     l   ALTER TABLE ONLY public."user " ALTER COLUMN role SET DEFAULT nextval('public."user _role_seq"'::regclass);
 ;   ALTER TABLE public."user " ALTER COLUMN role DROP DEFAULT;
       public          postgres    false    215    214    215                      0    24769    book 
   TABLE DATA           |   COPY public.book ("id ", title, "slug ", "description ", "price ", cover_path, file_path, create_at, update_at) FROM stdin;
    public          postgres    false    216                     0    24788 
   sales_item 
   TABLE DATA           O   COPY public.sales_item ("id ", book_id, order_id, price, dows_ava) FROM stdin;
    public          postgres    false    219   �                  0    24777    sales_order 
   TABLE DATA           _   COPY public.sales_order ("id ", customer_id, "total ", playment_status, create_at) FROM stdin;
    public          postgres    false    218   �                  0    24763    user  
   TABLE DATA           z   COPY public."user " ("id ", "firstname ", lastname, "fullname ", email, password, role, create_at, update_at) FROM stdin;
    public          postgres    false    215   8!                  0    0    sales_order_playment_status_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public.sales_order_playment_status_seq', 1, false);
          public          postgres    false    217                       0    0    user _role_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public."user _role_seq"', 1, false);
          public          postgres    false    214            w           2606    24775    book book_pkey 
   CONSTRAINT     O   ALTER TABLE ONLY public.book
    ADD CONSTRAINT book_pkey PRIMARY KEY ("id ");
 8   ALTER TABLE ONLY public.book DROP CONSTRAINT book_pkey;
       public            postgres    false    216            y           2606    24782    sales_order pk 
   CONSTRAINT     O   ALTER TABLE ONLY public.sales_order
    ADD CONSTRAINT pk PRIMARY KEY ("id ");
 8   ALTER TABLE ONLY public.sales_order DROP CONSTRAINT pk;
       public            postgres    false    218            {           2606    24792    sales_item sales_item_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public.sales_item
    ADD CONSTRAINT sales_item_pkey PRIMARY KEY ("id ");
 D   ALTER TABLE ONLY public.sales_item DROP CONSTRAINT sales_item_pkey;
       public            postgres    false    219            u           2606    24768    user  user _pkey 
   CONSTRAINT     U   ALTER TABLE ONLY public."user "
    ADD CONSTRAINT "user _pkey" PRIMARY KEY ("id ");
 >   ALTER TABLE ONLY public."user " DROP CONSTRAINT "user _pkey";
       public            postgres    false    215            }           2606    24793    sales_item fk_book_id    FK CONSTRAINT     v   ALTER TABLE ONLY public.sales_item
    ADD CONSTRAINT fk_book_id FOREIGN KEY (book_id) REFERENCES public.book("id ");
 ?   ALTER TABLE ONLY public.sales_item DROP CONSTRAINT fk_book_id;
       public          postgres    false    3191    219    216            ~           2606    24798    sales_item fk_order_id    FK CONSTRAINT        ALTER TABLE ONLY public.sales_item
    ADD CONSTRAINT fk_order_id FOREIGN KEY (order_id) REFERENCES public.sales_order("id ");
 @   ALTER TABLE ONLY public.sales_item DROP CONSTRAINT fk_order_id;
       public          postgres    false    3193    218    219            |           2606    24783    sales_order pk_customer_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.sales_order
    ADD CONSTRAINT pk_customer_id FOREIGN KEY (customer_id) REFERENCES public."user "("id ");
 D   ALTER TABLE ONLY public.sales_order DROP CONSTRAINT pk_customer_id;
       public          postgres    false    3189    218    215               �   x��1�0Eg��["�)R�YX,4R ���{���'i�� }��<�/}C7�N��O�v��lۦs�|:��?�h7�l5����x�$il�~�~u#��`'�^�r���?vq��1�(�磭v��Rе`�ĕኩ���l�OT�Z+��̠��         .   x�320��44�4�462�42�300�10PxԴ����؄+F��� ���         9   x�362�426 z:
���p�FƺF��
FV�FVF��\1z\\\ &�
t         �   x�Ս;
�0Dk�����J�GU�f��#�����Rn���;�*S.m�'s�� ������Ԓ�����^Z��)�Gr}�2֡K���&v>\��l����[�G�Ȱ[�<[�,�B$����i�W�Wa     